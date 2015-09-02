class SEO

  def self.objects_for_seo(controller_name)
    case controller_name
      when 'articles'
        Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC")
      when 'exercises'
        Exercise.where("display = ? AND date <= ?", true, Date.today).order("date DESC")
      when 'body_parts'
        BodyPart.where(:display => true).order(:position)
      when 'body_part_sections'
        BodyPartSection.where(:display => true).order(:body_part_id)
      when 'case_studies'
        CaseStudy.where("display = ? AND date <= ?", true, Date.today).order("date DESC")
      when 'pages'
        Page.where(:display => true)
      when 'treatments'
        Treatment.where(:display => true)
      when 'team_members'
        TeamMember.where(:display => true)
      when 'prices'
        Price.where(:display => true)
      when '' # These lines are in for syntactical
        []    # reasons and can be deleted

      # In this area write cases for each of the modules with show pages
      # that you would like to appear in the admin seo section. Eg.
      #
      # when 'articles'
      #   Article.order(:title)



      else
        []
    end
  end

  def self.objects_for_sitemap(controller_name)
    case controller_name
      when 'articles'
        Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC")
      when 'body_parts'
        BodyPart.where(:display => true).order(:position)
      when 'body_part_sections'
        BodyPartSection.where(:display => true).order(:body_part_id)
      when 'case_studies'
        CaseStudy.where("display = ? AND date <= ?", true, Date.today).order("date DESC")
      when 'pages'
        Page.where(:display => true)
      when 'treatments'
        Treatment.where(:display => true)
      when 'team_member'
        TeamMember.where(:display => true)
      when 'prices'
        Price.where(:display => true)
      when '' # These lines are in for syntactical
        []    # reasons and can be deleted

      # In this area write cases for each of the modules with show pages
      # that you would like to appear in the admin sitemap. Eg.
      #
      # when 'articles'
      #   Article.where(:display => true).order(:title)

      else
        []
    end
  end

  def self.rebuild!
    nominal_urls_added = []

    # The method for retrieving the routes and their details keeps changing
    # between rails versions so this is likely to keep needing updating.
    routes = Rails.application.routes.routes.select{|x| [//, /^GET$/].include?(x.verb)}.map do |route|
      { :alias => route.name,
        :path => route.path.spec.to_s.gsub("(.:format)", ""),
        :controller => route.defaults[:controller],
        :action => route.defaults[:action] }
    end

    # Reject routes without a controller such as 301s
    routes = routes.reject{|route| route[:controller].nil?}

    # Reject admin routes
    routes = routes.reject{|route| route[:controller].include?("admin")}
    #raise routes.to_yaml
    routes.each do |route|
      if route[:path].include? ":id"
        uses_friendly_id = nil
        has_name_method = nil

        objects_for_sitemap = SEO.objects_for_sitemap(route[:controller])

        SEO.objects_for_seo(route[:controller]).each do |object|
          has_parent = nil
          parent_method = nil
          parent_path = nil

          if uses_friendly_id.nil?
            begin
              object.friendly_id
            rescue NoMethodError
              uses_friendly_id = false
            else
              uses_friendly_id = true
            end
          end

          if has_name_method.nil?
            begin
              object.name
            rescue NoMethodError
              has_name_method = false
            else
              has_name_method = true
            end
          end

          if has_parent.nil?

            split_paths = route[:path].split("/")

            split_paths.each do |split|
              if split.include?("_id")
                has_parent = true
                parent_path = split
                parent_method = split.gsub("_id", "").gsub(":", "")
              end
            end

            if has_parent.nil?
              has_parent = false
            end


            if has_parent and !parent_method.blank?
              parent_uses_friendly_id = nil
              if parent_uses_friendly_id.nil?
                begin

                  object.send(parent_method).friendly_id
                rescue NoMethodError
                  parent_uses_friendly_id = false
                else
                  parent_uses_friendly_id = true
                end
              end
            end
          end

          if uses_friendly_id
            if has_parent and parent_uses_friendly_id
              nominal_url = route[:path].gsub(':id', object.friendly_id).gsub(parent_path, object.send(parent_method).friendly_id)

              seo_entry = SeoEntry.find_or_create_by_nominal_url(nominal_url)
              nominal_urls_added << nominal_url
            elsif has_parent

              nominal_url = route[:path].gsub(':id', object.friendly_id).gsub(parent_path, object.send("#{parent_method}_id").to_s)
              seo_entry = SeoEntry.find_or_create_by_nominal_url(nominal_url)
              nominal_urls_added << nominal_url
            else
              seo_entry = SeoEntry.find_or_create_by_nominal_url(route[:path].gsub(':id', object.friendly_id))
              nominal_urls_added << route[:path].gsub(':id', object.friendly_id)
            end


            if seo_entry.title.blank?
              if has_name_method
                seo_entry.title = object.name
              else
                seo_entry.title = object.friendly_id.gsub('-', ' ').capitalize
              end
            end
          else
            if has_parent and parent_uses_friendly_id
              nominal_url = route[:path].gsub(':id', object.friendly_id).gsub(parent_path, object.send(parent_method).friendly_id)
              seo_entry = SeoEntry.find_or_create_by_nominal_url(nominal_url)
              nominal_urls_added << nominal_url
            elsif has_parent
              nominal_url = route[:path].gsub(':id', object.friendly_id).gsub(parent_path, object.send("#{parent_method}_id").to_s)
              seo_entry = SeoEntry.find_or_create_by_nominal_url(nominal_url)
              nominal_urls_added << nominal_url
            else
              seo_entry = SeoEntry.find_or_create_by_nominal_url(route[:path].gsub(':id', object.id.to_s))
              nominal_urls_added << route[:path].gsub(':id', object.id.to_s)
            end

            if seo_entry.title.blank?
              if has_name_method
                seo_entry.title = object.name
              else
                seo_entry.title = "#{object.class.name} - #{object.id}"
              end
            end
          end
          seo_entry.in_sitemap = objects_for_sitemap.include? object
          seo_entry.save
        end
      else
        seo_entry = SeoEntry.find_or_create_by_nominal_url(route[:path])
        nominal_urls_added << route[:path]
        if route[:alias].blank?
          raise route.to_yaml
        end

        seo_entry.title = route[:alias].gsub('_', ' ').capitalize if seo_entry.title.blank?
        seo_entry.save
      end
    end

    SeoEntry.where("nominal_url NOT IN (?)", nominal_urls_added).each{|x| x.destroy}
  end

end

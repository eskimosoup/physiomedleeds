module ApplicationHelper

  def branch_classes(branch)
    classes = []
    classes << "active"  if @current_branch && @current_branch.name == branch.name
    classes << "red" if %w( injury injuries ).include?(branch.name.downcase)
    classes.compact.join(" ")
  end

  def calltracks(options = {})
    return if SITE_SETTINGS['Leeds Phone'].blank?
    link_to "tel:#{SITE_SETTINGS['Leeds Phone'].gsub(/\s+/, '')}", options do
      content_tag :span,
                  SITE_SETTINGS['Leeds Phone'],
                  class: 'calltracks_physiotherapyinleedscouk-main'
    end
  end
end

PhysiomedLeeds::Application.routes.draw do

  get '/pages/prices' to: redirect('/pages/treatments')
  namespace :admin do
    manticore_resources :testimonials
    chronicler_resources :articles
    chronicler_resources :banners
    chronicler_resources :pages
    chronicler_resources :body_parts do
      manticore_resources :body_part_sections
    end
    chronicler_resources :treatments
    chronicler_resources :prices
    chronicler_resources :team_members
    manticore_resources :action_quotes
    manticore_resources :seo_entries do
      get 'rebuild_seo', :on => :collection
    end
  end

  get "sitemap" => "application#sitemap"
  resources :articles
  resources :body_parts, :path => "body-parts", :only => [:index, :show] do
    resources :body_part_sections, :path => "body-part-sections", :only => [:show]
  end
  resources :bookings, :only => [:new, :create] do
    get "thank_you", :path => "thank-you", :on => :collection
  end
  resources :contacts, :only => [:new, :create] do
    get "thank_you", :path => "thank-you", :on => :collection
  end
  resources :pages
  resources :team_members, only: [:index]
  resources :testimonials, only: [:index, :show]
  resources :treatments, only: [:index, :show]

  root :to => "application#index"

  mount Manticore::Engine => "/admin"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

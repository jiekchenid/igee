Igee::Application.routes.draw do
  root :to => 'site#index'
  
  
  match 'signup' => 'users#new', :as => :signup
  match 'register' => 'users#create', :as => :register
  match 'login' => 'sessions#new', :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout
  
  match 'about' => 'site#about'
  match 'report' => 'site#report'
  match 'faq' => 'site#faq'
  
  match 'unread_comments' => 'site#unread_comments'
  match 'oauth(/:action)' => 'oauth#(/:action)'
  match 'setting' => 'users#edit'
  
  resource :session, :only => [:new, :create, :destroy]

  resources :venues do
    member do
      get :have_done
      get :publish_requirement
    end
  end

  resources :actions
  
  resources :requirements do
    resources :plans
  end
    
  resources :geos
  resources :users do
    collection do
      get   :welcome
    end
    member do
      
    end
  end
  resources :records
  resources :feedbacks do 
      get :thanks, :on => :collection
  end
  resources :follows
  resources :comments
  resources :photos
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

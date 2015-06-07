Rails.application.routes.draw do



  get 'forum_threads/new' => 'forum_threads#new', as: :new_forum_thread
  get 'forum_threads/:id' => 'forum_threads#show',as: :forum_thread
  get 'forum_threads' => "forum_threads#index",as: :forum_threads
  post'/forum_posts' => 'forum_threads#create', as: :create_forum_post
  patch "/forum_threads/:id/edit" => "forum_threads#update",as: :update_forum_threads
  put "/forum_threads/:id/edit" => "forum_threads#update",as: :update_forum_thread



  get "forum_posts/:id/edit" => "forum_threads/forum_posts#edit",as: :edit_forum_post
  # get "forum_posts/:id/edit" => "forum_threads/forum_posts#edit",as: :edit_forum_posts
  patch "forum_posts/:id/edit" => "forum_threads/forum_posts#update",as: :update_forum_posts
  # put "forum_posts/:id/edit" => "forum_threads/forum_posts#update",as: :update_forum_post
  delete 'forum_posts/:id' =>'forum_threads/forum_posts#destroy',as: :destroy



  delete 'forum_threads/:id' =>'forum_threads#destroy',as: :destroy_thread




  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end



  root 'pages#home'

    get '/pages' => 'pages#home',as: :home

    get "/about" => "about#index",as: :about
    get '/profile' => "profiles#forum",as: :profile
    get '/contact' => "contacts#forum",as: :contact
    get '/review' => "reviews#forum",as: :review


    get 'users/index' =>'users#index',as: :users
    get 'users/new' => 'users#new',as: :new_user
    post "/" => 'users#create', as: :create_user



    get 'users/session' => 'sessions#new',as: :new_session
    post 'sessions/create' => 'sessions#create',as: :create_session
    get 'sessions/destroy' => 'sessions#destroy',as: :destroy_session






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#forum'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

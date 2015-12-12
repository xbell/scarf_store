Rails.application.routes.draw do

  get "/", to: "product#index"
  get "/account", to: "product#account", as: :account
  get "/scarves/:id", to: "product#show_one", as: :scarf
  get "/scarves", to: "product#show_all", as: :scarves

  get "/signup", to: "product#signup", as: :signup
  post "/signup", to: "user#create", as: :create

  get "/log-out", to: "sessions#log_out", as: :log_out
  post "/log-in", to: "sessions#log_in", as: :log_in

  get "/cart", to: "item#cart", as: :cart
  post "/scarves/:id", to: "item#add_to_cart", as: :add_to_cart
  post "/cart/:id", to: "item#update_cart"
  delete "/cart/:id", to: "item#delete_item"

  get "/products", to: "admin#index", as: :product_index
  post "/products/admin", to: "admin#add_product"
  get "/product/admin/:id", to: "admin#show_one", as: :product_edit
  post "/product/admin/:id", to: "admin#update"
  delete "/product/admin/:id", to: "admin#delete"

  get "/checkout", to: "order#checkout"




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

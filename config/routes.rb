Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations'}
  
  root 'static_pages#home'
  
  get '/administrador' => 'static_pages#admin'  #admin es el nombre del archivo
  
  get '/home' =>      'static_pages#home'
  get '/egresados' => 'static_pages#egresados'
  get '/acercade' =>  'static_pages#about'
  
  
  resources :notices
  
  resources :users, only: [:index, :show, :edit,:update,:destroy]
  
  
  get 'principal/index'
  get 'evento' => 'evento#listar'
  get 'evento/nuevo' => 'evento#nuevo'
  post 'evento/nuevo' => 'evento#nuevo'
  post 'evento/crear' => 'evento#crear'
  get 'evento/crear' => 'evento#crear'
  get 'evento/eliminar' => 'evento#eliminar'
  post 'evento/eliminar' => 'evento#eliminar'
  get 'evento/mostrar'
  get 'evento/modificar' => 'evento#modificar'
  post 'evento/modificar' => 'evento#modificar'
  
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

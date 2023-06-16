Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
 }

  devise_for :admins, skip: [:registrations, :passwords],  controllers: {
    sessions: "admin/sessions"
 }


  scope module: :public do
    
    controller :homes do
      root to: 'homes#top'
      get 'homes/about' => "homes#about"
    end
    
    controller :items do
      resources :items, only: [:index, :show, :create]
    end
    
    controller :customers do
      get '/customers/my_page' => "customers#show"
      get '/customers/information/edit' => "customers#edit"
      patch '/customers/information' => "customers#update"
      get '/customers/unsubscribe' => "customers#unsubscribe"
      patch '/customers/withdraw' => "customers#withdraw"
    end
    
    controller :cart_items do
      resources :cart_items, only: [:index, :update, :destroy, :create]
      delete '/cart_items/destroy_all' => "customers#destory_all"
    end


    controller :orders do
      resources :orders, only: [:index, :show, :create]
      delete '/cart_items/destroy_all' => "customers#destory_all"
      get 'orders/new' => "orders#new"
      get 'orders/complete' => "orders#complete"
      post 'order/confirm' => "orders#confirm"
    end
    


    controller :delivery_addresses do
      resources :delivery_addresses, only: [:index, :create, :edit, :update, :destroy]
    end

  end


  namespace :admin do

    controller :homes do
      root to: "homes#top"
    end

    resources :genres, only: [:index, :create, :edit, :update]

    resources :items, only: [:index, :new, :create, :show, :edit, :update ]
    
    resources :customers, only: [:index, :show, :edit, :update ]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
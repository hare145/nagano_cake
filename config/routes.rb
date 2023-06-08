Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
 }  
  
  devise_for :admins, skip: [:registrations, :passwords],  controllers: {
    sessions: "admin/sessions"
 }


  scope module: :public do
    
    controller :home do
      root to: 'homes#top'
      get 'homes/about' => "homes#about"
    end
    
    controller :customers do
      get '/customers/my_page' => "customers#show"
      get '/customers/information/edit' => "customers#edit"
      patch '/customers/information' => "customers#update"
      get '/customers/unsubscribe' => "customers#unsubscribe"
      patch '/customers/withdraw' => "customers#withdraw"
    end
    
  end
  

  namespace :admin do
    
    resources :genres, only: [:index, :create, :edit, :update]
    
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
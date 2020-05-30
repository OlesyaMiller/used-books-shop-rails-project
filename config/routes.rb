Rails.application.routes.draw do
    root 'static#home'
    resources :genres
    resources :purchases
    resources :books
    resources :users do
        resources :books
    end

    get '/signin', to: "session#signin", as: 'signin'
    post '/signin', to: "session#create", as: 'session'
    get '/logout', to: "session#destroy", as: 'logout'
    get '/auth/facebook/callback' => 'session#omniauth'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

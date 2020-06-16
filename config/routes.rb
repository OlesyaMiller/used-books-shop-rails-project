Rails.application.routes.draw do
    root 'static#home'
    
    resources :genres
    resources :purchases
    resources :books
    resources :users do
        resources :purchases, :books 
    end

    get '/signin', to: "session#signin"
    post '/signin', to: "session#create"
    get '/logout', to: "session#destroy"

    get '/auth/facebook/callback' => 'session#omniauth'
end

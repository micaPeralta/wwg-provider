Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    namespace :api do
        namespace :v1 do

          resources :materials , defaults: { format: 'json' } ,only: [:index]do
            collection do
              put ':id/book' , to:'materials#book'
              get '/find' , to:'materials#fildByIds'
            end
          end

          resources :users, defaults: { format: 'json' }
          post '/auth/login', to: 'authentication#login'
        end
    end
  # Defines the root path route ("/")
end

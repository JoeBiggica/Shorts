Rails.application.routes.draw do

resources :users do
  resources :pictures
end

resources :pictures
resources :shorts

root 'pictures#new'

get '/login', to: 'users#index'
post '/login', to: 'session#index'

end

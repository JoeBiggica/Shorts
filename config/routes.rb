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


#            Prefix Verb   URI Pattern                                 Controller#Action
#     user_pictures GET    /users/:user_id/pictures(.:format)          pictures#index
#                   POST   /users/:user_id/pictures(.:format)          pictures#create
#  new_user_picture GET    /users/:user_id/pictures/new(.:format)      pictures#new
# edit_user_picture GET    /users/:user_id/pictures/:id/edit(.:format) pictures#edit
#      user_picture GET    /users/:user_id/pictures/:id(.:format)      pictures#show
#                   PATCH  /users/:user_id/pictures/:id(.:format)      pictures#update
#                   PUT    /users/:user_id/pictures/:id(.:format)      pictures#update
#                   DELETE /users/:user_id/pictures/:id(.:format)      pictures#destroy
#             users GET    /users(.:format)                            users#index
#                   POST   /users(.:format)                            users#create
#          new_user GET    /users/new(.:format)                        users#new
#         edit_user GET    /users/:id/edit(.:format)                   users#edit
#              user GET    /users/:id(.:format)                        users#show
#                   PATCH  /users/:id(.:format)                        users#update
#                   PUT    /users/:id(.:format)                        users#update
#                   DELETE /users/:id(.:format)                        users#destroy
#          pictures GET    /pictures(.:format)                         pictures#index
#                   POST   /pictures(.:format)                         pictures#create
#       new_picture GET    /pictures/new(.:format)                     pictures#new
#      edit_picture GET    /pictures/:id/edit(.:format)                pictures#edit
#           picture GET    /pictures/:id(.:format)                     pictures#show
#                   PATCH  /pictures/:id(.:format)                     pictures#update
#                   PUT    /pictures/:id(.:format)                     pictures#update
#                   DELETE /pictures/:id(.:format)                     pictures#destroy
#            shorts GET    /shorts(.:format)                           shorts#index
#                   POST   /shorts(.:format)                           shorts#create
#         new_short GET    /shorts/new(.:format)                       shorts#new
#        edit_short GET    /shorts/:id/edit(.:format)                  shorts#edit
#             short GET    /shorts/:id(.:format)                       shorts#show
#                   PATCH  /shorts/:id(.:format)                       shorts#update
#                   PUT    /shorts/:id(.:format)                       shorts#update
#                   DELETE /shorts/:id(.:format)                       shorts#destroy
#              root GET    /                                           pictures#new
#             login GET    /login(.:format)                            users#index
#                   POST   /login(.:format)                            session#index
#        shorts_new GET    /shorts/new(.:format)                       shorts#new
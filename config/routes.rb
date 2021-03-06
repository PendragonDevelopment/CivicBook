# == Route Map
#
#                      Prefix Verb   URI Pattern                                 Controller#Action
#         get_representatives POST   /get_representatives(.:format)              civic_info_controller#get_representatives
#     representatives_results GET    /representatives_results(.:format)          civic_info_controller#representatives_results
#     representative_profiles GET    /representative_profiles(.:format)          representative_profiles#index
#                             POST   /representative_profiles(.:format)          representative_profiles#create
#  new_representative_profile GET    /representative_profiles/new(.:format)      representative_profiles#new
# edit_representative_profile GET    /representative_profiles/:id/edit(.:format) representative_profiles#edit
#      representative_profile GET    /representative_profiles/:id(.:format)      representative_profiles#show
#                             PATCH  /representative_profiles/:id(.:format)      representative_profiles#update
#                             PUT    /representative_profiles/:id(.:format)      representative_profiles#update
#                             DELETE /representative_profiles/:id(.:format)      representative_profiles#destroy
#                        root GET    /                                           visitors#index
#            new_user_session GET    /users/sign_in(.:format)                    devise/sessions#new
#                user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#        destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#               user_password POST   /users/password(.:format)                   devise/passwords#create
#           new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#          edit_user_password GET    /users/password/edit(.:format)              devise/passwords#edit
#                             PATCH  /users/password(.:format)                   devise/passwords#update
#                             PUT    /users/password(.:format)                   devise/passwords#update
#    cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#           user_registration POST   /users(.:format)                            devise/registrations#create
#       new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#      edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                             PATCH  /users(.:format)                            devise/registrations#update
#                             PUT    /users(.:format)                            devise/registrations#update
#                             DELETE /users(.:format)                            devise/registrations#destroy
#                       users GET    /users(.:format)                            users#index
#                             POST   /users(.:format)                            users#create
#                    new_user GET    /users/new(.:format)                        users#new
#                   edit_user GET    /users/:id/edit(.:format)                   users#edit
#                        user GET    /users/:id(.:format)                        users#show
#                             PATCH  /users/:id(.:format)                        users#update
#                             PUT    /users/:id(.:format)                        users#update
#                             DELETE /users/:id(.:format)                        users#destroy
#

Rails.application.routes.draw do

  resources :feedbacks
  post 'get_representatives', to: 'civic_info#get_representatives'
  get 'representatives_results', to: 'civic_info#representatives_results'
  get '/about', to: 'visitors#about'
  resources :representative_profiles
  root to: 'visitors#index'
  devise_for :users
  resources :users
end

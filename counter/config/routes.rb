# == Route Map
#
#                                Prefix Verb       URI Pattern                                                                              Controller#Action
#                      new_user_session GET        /admin/login(.:format)                                                                   active_admin/devise/sessions#new
#                          user_session POST       /admin/login(.:format)                                                                   active_admin/devise/sessions#create
#                  destroy_user_session DELETE|GET /admin/logout(.:format)                                                                  active_admin/devise/sessions#destroy
#                     new_user_password GET        /admin/password/new(.:format)                                                            active_admin/devise/passwords#new
#                    edit_user_password GET        /admin/password/edit(.:format)                                                           active_admin/devise/passwords#edit
#                         user_password PATCH      /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       PUT        /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                       POST       /admin/password(.:format)                                                                active_admin/devise/passwords#create
#                            admin_root GET        /admin(.:format)                                                                         admin/dashboard#index
#         batch_action_admin_candidates POST       /admin/candidates/batch_action(.:format)                                                 admin/candidates#batch_action
#                      admin_candidates GET        /admin/candidates(.:format)                                                              admin/candidates#index
#                                       POST       /admin/candidates(.:format)                                                              admin/candidates#create
#                   new_admin_candidate GET        /admin/candidates/new(.:format)                                                          admin/candidates#new
#                  edit_admin_candidate GET        /admin/candidates/:id/edit(.:format)                                                     admin/candidates#edit
#                       admin_candidate GET        /admin/candidates/:id(.:format)                                                          admin/candidates#show
#                                       PATCH      /admin/candidates/:id(.:format)                                                          admin/candidates#update
#                                       PUT        /admin/candidates/:id(.:format)                                                          admin/candidates#update
#                                       DELETE     /admin/candidates/:id(.:format)                                                          admin/candidates#destroy
#                       admin_dashboard GET        /admin/dashboard(.:format)                                                               admin/dashboard#index
#              batch_action_admin_users POST       /admin/users/batch_action(.:format)                                                      admin/users#batch_action
#                           admin_users GET        /admin/users(.:format)                                                                   admin/users#index
#                                       POST       /admin/users(.:format)                                                                   admin/users#create
#                        new_admin_user GET        /admin/users/new(.:format)                                                               admin/users#new
#                       edit_admin_user GET        /admin/users/:id/edit(.:format)                                                          admin/users#edit
#                            admin_user GET        /admin/users/:id(.:format)                                                               admin/users#show
#                                       PATCH      /admin/users/:id(.:format)                                                               admin/users#update
#                                       PUT        /admin/users/:id(.:format)                                                               admin/users#update
#                                       DELETE     /admin/users/:id(.:format)                                                               admin/users#destroy
#                        admin_comments GET        /admin/comments(.:format)                                                                admin/comments#index
#                                       POST       /admin/comments(.:format)                                                                admin/comments#create
#                         admin_comment GET        /admin/comments/:id(.:format)                                                            admin/comments#show
#                                       DELETE     /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                                  root GET        /                                                                                        candidates#index
#                             open_vote POST       /votes/:id/open(.:format)                                                                votes#open
#                                 votes GET        /votes(.:format)                                                                         votes#index
#                                       POST       /votes(.:format)                                                                         votes#create
#                            candidates GET        /candidates(.:format)                                                                    candidates#index
#                               results GET        /results(.:format)                                                                       results#index
#         rails_postmark_inbound_emails POST       /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST       /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST       /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET        /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST       /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST       /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET        /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST       /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#         rails_conductor_inbound_email GET        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH      /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT        /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE     /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST       /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "candidates#index"
  resources :votes, only: [:index, :create] do
    member do
      post :open
    end
  end
  resources :candidates, only: :index
  resources :results, only: :index
end

# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                                  root GET    /                                                                                        homes#index
#                           homes_index GET    /homes/index(.:format)                                                                   homes#index
#                                 login GET    /login(.:format)                                                                         sessions#new
#                                       POST   /login(.:format)                                                                         sessions#create
#                                logout DELETE /logout(.:format)                                                                        sessions#destroy
#                              products GET    /products(.:format)                                                                      products#index
#                                       POST   /products(.:format)                                                                      products#create
#                           new_product GET    /products/new(.:format)                                                                  products#new
#                          edit_product GET    /products/:id/edit(.:format)                                                             products#edit
#                               product GET    /products/:id(.:format)                                                                  products#show
#                                       PATCH  /products/:id(.:format)                                                                  products#update
#                                       PUT    /products/:id(.:format)                                                                  products#update
#                                       DELETE /products/:id(.:format)                                                                  products#destroy
#                     new_cart_checkout GET    /cart/checkout/new(.:format)                                                             checkouts#new
#                    edit_cart_checkout GET    /cart/checkout/edit(.:format)                                                            checkouts#edit
#                         cart_checkout GET    /cart/checkout(.:format)                                                                 checkouts#show
#                                       PATCH  /cart/checkout(.:format)                                                                 checkouts#update
#                                       PUT    /cart/checkout(.:format)                                                                 checkouts#update
#                                       DELETE /cart/checkout(.:format)                                                                 checkouts#destroy
#                                       POST   /cart/checkout(.:format)                                                                 checkouts#create
#                              new_cart GET    /cart/new(.:format)                                                                      carts#new
#                             edit_cart GET    /cart/edit(.:format)                                                                     carts#edit
#                                  cart GET    /cart(.:format)                                                                          carts#show
#                                       PATCH  /cart(.:format)                                                                          carts#update
#                                       PUT    /cart(.:format)                                                                          carts#update
#                                       DELETE /cart(.:format)                                                                          carts#destroy
#                                       POST   /cart(.:format)                                                                          carts#create
#                           order_items GET    /order_items(.:format)                                                                   order_items#index
#                                       POST   /order_items(.:format)                                                                   order_items#create
#                        new_order_item GET    /order_items/new(.:format)                                                               order_items#new
#                       edit_order_item GET    /order_items/:id/edit(.:format)                                                          order_items#edit
#                            order_item GET    /order_items/:id(.:format)                                                               order_items#show
#                                       PATCH  /order_items/:id(.:format)                                                               order_items#update
#                                       PUT    /order_items/:id(.:format)                                                               order_items#update
#                                       DELETE /order_items/:id(.:format)                                                               order_items#destroy
#                          refund_order PUT    /orders/:id/refund(.:format)                                                             orders#refund
#                                orders GET    /orders(.:format)                                                                        orders#index
#                                       POST   /orders(.:format)                                                                        orders#create
#                             new_order GET    /orders/new(.:format)                                                                    orders#new
#                            edit_order GET    /orders/:id/edit(.:format)                                                               orders#edit
#                                 order GET    /orders/:id(.:format)                                                                    orders#show
#                                       PATCH  /orders/:id(.:format)                                                                    orders#update
#                                       PUT    /orders/:id(.:format)                                                                    orders#update
#                                       DELETE /orders/:id(.:format)                                                                    orders#destroy
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  root to: 'homes#index'
  get 'homes/index'
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :products
  resource :cart do
    resource :checkout
  end
  resources :order_items
  resources :orders do
    member do
      put :refund
    end
  end
end

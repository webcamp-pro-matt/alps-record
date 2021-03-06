Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :destroy, :update]
  resources :goods, only: [:index, :show]
  resources :cart, only: [:index, :create, :update, :destroy]
  resources :orders, only: [:index, :create, :show, :destroy, :new]

  get "/" => "home#top"
  get "home/done" => "home#done"

  get "admin/users" => "users#admin"
  get "admin/" => "users#admin_index"
  get "admin/show" => "users#admin_show"
  delete "admin/users/:id" => "users#admin_destroy", as: "destroy_admin_user"
  get "admin/users/:id/edit" => "users#admin_edit", as: "edit_admin_user"
  put "admin/users/:id" => "users#admin_update", as: "update_admin_user"

  get "admin/goods/" => "goods#admin_index"
  get "admin/goods/new" => "goods#admin_new"
  get "search" => "goods#search"
  get "admin/goods/:id" => "goods#admin_show", as: "show_admin_good"
  get "admin/goods/:id/edit" => "goods#admin_edit", as: "edit_admin_good"
  post "admin/goods/:id" => "goods#admin_create", as: "create_admin_good"
  delete "admin/goods/:id" => "goods#admin_destroy", as: "destroy_admin_good"
  put "admin/goods/:id" => "goods#admin_update", as: "update_admin_good"

  get "admin/orders/:id/edit" => "orders#admin_edit", as: "edit_admin_order"
  put "admin/orders/:id" => "orders#admin_update", as: "update_admin_order"

=begin
  Prefix Verb             URI Pattern                                                                                     Controller#Action
         new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
             user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
            user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
                          PUT    /users/password(.:format)                                                                devise/passwords#update
                          POST   /users/password(.:format)                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
        user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
                          PUT    /users(.:format)                                                                         devise/registrations#update
                          DELETE /users(.:format)                                                                         devise/registrations#destroy
                          POST   /users(.:format)                                                                         devise/registrations#create
                edit_user GET    /users/:id/edit(.:format)                                                                users#edit
                     user GET    /users/:id(.:format)                                                                     users#show
                          PATCH  /users/:id(.:format)                                                                     users#update
                          PUT    /users/:id(.:format)                                                                     users#update
                          DELETE /users/:id(.:format)                                                                     users#destroy
                    goods GET    /goods(.:format)                                                                         goods#index
                     good GET    /goods/:id(.:format)                                                                     goods#show
               cart_index GET    /cart(.:format)                                                                          cart#index
                          POST   /cart(.:format)                                                                          cart#create
                     cart PATCH  /cart/:id(.:format)                                                                      cart#update
                          PUT    /cart/:id(.:format)                                                                      cart#update
                          DELETE /cart/:id(.:format)                                                                      cart#destroy
                   orders GET    /orders(.:format)                                                                        orders#index
                          POST   /orders(.:format)                                                                        orders#create
                new_order GET    /orders/new(.:format)                                                                    orders#new
                    order GET    /orders/:id(.:format)                                                                    orders#show
                          DELETE /orders/:id(.:format)                                                                    orders#destroy
                          GET    /                                                                                        home#top
                home_done GET    /home/done(.:format)                                                                     home#done
              admin_users GET    /admin/users(.:format)                                                                   users#admin
                    admin GET    /admin(.:format)                                                                         users#admin_index
               admin_show GET    /admin/show(.:format)                                                                    users#admin_show
       destroy_admin_user DELETE /admin/users/:id(.:format)                                                               users#admin_destroy
          edit_admin_user GET    /admin/users/:id/edit(.:format)                                                          users#admin_edit
        update_admin_user PUT    /admin/users/:id(.:format)                                                               users#admin_update
              admin_goods GET    /admin/goods(.:format)                                                                   goods#admin_index
          admin_goods_new GET    /admin/goods/new(.:format)                                                               goods#admin_new
                   search GET    /search(.:format)                                                                        goods#search
          show_admin_good GET    /admin/goods/:id(.:format)                                                               goods#admin_show
          edit_admin_good GET    /admin/goods/:id/edit(.:format)                                                          goods#admin_edit
        create_admin_good POST   /admin/goods/:id(.:format)                                                               goods#admin_create
       destroy_admin_good DELETE /admin/goods/:id(.:format)                                                               goods#admin_destroy
        update_admin_good PUT    /admin/goods/:id(.:format)                                                               goods#admin_update
         edit_admin_order GET    /admin/orders/:id/edit(.:format)                                                         orders#admin_edit
       update_admin_order PUT    /admin/orders/:id(.:format)                                                              orders#admin_update
               refile_app        /attachments                                                                             #<Refile::App app_file="/home/vagrant/.bundle/ruby/2.5.0/refile-46b4178654e6/lib/refile/app.rb">
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
vagrant@ubuntu-bionic:/vagrant/alps_record$ 
=end

end

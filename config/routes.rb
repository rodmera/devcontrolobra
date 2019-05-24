Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :invoices
  resources :products
  resources :orders
  resources :suppliers
  resources :projects
  resources :metrics
  devise_for :users
#get 'oc/index'
resources :ordenes

get 'aprobar/:id' => 'orders#aprobar', as: :aprobar

root :to => 'orders#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :purchases
root :to => 'purchases#index'

resources :items
root :to => 'items#index'


  resources :purchases, except: [:edit, :update, :destroy] do
    collection do
      match 'search' => 'puchases#search', via: [:get, :post], as: :search
    end
  end

#get 'projects/:id/items' => 'projects#items', :as => :project_items

# Which gives..

# update_row_order_things POST   /things/update_row_order(.:format) things#update_row_order   
end

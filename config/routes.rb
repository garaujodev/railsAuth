Rails.application.routes.draw do
  get 'user/list', to: 'auth#list'
  get 'user/:id', to: 'auth#show'
  put 'user/update/:id', to: 'auth#update'
  delete 'user/:id', to: 'auth#delete'

  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
	root "posts#index"
  resource :posts
  resource :users

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end

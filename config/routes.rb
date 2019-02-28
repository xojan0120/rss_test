Rails.application.routes.draw do
  resources :users
  get 'rss/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get :feed, to: 'rss#index', defaults: { format: :rss }
end

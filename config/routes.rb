Rails.application.routes.draw do
  root "users#index"
  resources :users
  get :feed, to: 'rss#index', defaults: { format: :rss }
end

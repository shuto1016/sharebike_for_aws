Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs
  resources :like, only: [:index]
  post   '/like/:article_id' => 'like#create',   as: 'like'
  delete '/like/:id' => 'like#destroy', as: 'unlike'
  post '/blogs/:article_id/comments' => 'comments#create', as: 'comments'
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  ## article機能のroute
  resources :blogs

  ## user機能のroute
  resources :users

  ## いいね機能のroute
  resources :like, only: [:index]
  post   '/like/:article_id' => 'like#create',   as: 'like'
  delete '/like/:id' => 'like#destroy', as: 'unlike'

  ## コメント機能のroute
  post '/blogs/:article_id/comments' => 'comments#create', as: 'comments'
  delete '/blogs/:comment_id/comments' => 'comments#destroy', as: 'comments_destroy'  

end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  resources :blogs do
    resources :comments, only: [:create]
  end
  
  resources :like, only: [:index]
  post   '/like/:article_id' => 'like#create',   as: 'like'
  delete '/like/:id' => 'like#destroy', as: 'unlike'
end

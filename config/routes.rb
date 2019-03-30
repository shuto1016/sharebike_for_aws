Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'blogs#index'
  get 'blogs' => 'blogs#index'
  get 'blogs/new' => 'blogs#new'
  post 'blogs' => 'blogs#create'
  delete'blogs/:id' => 'blogs#destroy'
  get 'blogs/:id/edit' => 'blogs#edit'
  patch 'blogs/:id' => 'blogs#update'
end

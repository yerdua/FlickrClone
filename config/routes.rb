FlickrClone::Application.routes.draw do
  root :to => "photos#new"
  
  devise_for :users

  resources :groups do
    resources :photos, only: [:index]
    resources :photo_shares, only: [:create, :destroy]
    resource :membership, only: [:create, :destroy]
  end
  resources :photos, only: [:create, :destroy, :new, :show, :update] do
    resources :photo_shares, only: [:create, :destroy]
  end
  resources :users do
    resource :friendship, only: [:create, :destroy]
    resources :photos, only: [:index]
  end
end

FlickrClone::Application.routes.draw do
  root :to => "root#root"
  
  devise_for :users
  
  resources :albums do
    resources :photos, only: [:index]
  end
  
  resources :friends, only: [:index]

  resources :groups do
    resource :membership, only: [:create, :destroy]
    resources :photos, only: [:index]
  end
  
  resources :photos, only: [:create, :destroy, :new, :show, :update]
  
  resources :users, only: [:show] do
    resources :albums, only: [:index]
    resource  :friendship, only: [:create, :destroy]
    resources :groups, only: [:index]
    resources :photos, only: [:index]
  end
  
end

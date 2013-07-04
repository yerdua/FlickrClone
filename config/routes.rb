FlickrClone::Application.routes.draw do
  root :to => "photos#new"
  
  devise_for :users
  
  resources :albums do
    resources :photos, only: [:index]
  end

  resources :groups do
    resource :membership, only: [:create, :destroy]
    resources :photos, only: [:index]
  end
  
  resources :photos, only: [:create, :destroy, :new, :show, :update]
  
  resources :users do
    # resource :friendship, only: [:create, :destroy]
    resources :photos, only: [:index]
    resources :albums, only: [:index]
  end
  
end

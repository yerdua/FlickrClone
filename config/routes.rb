FlickrClone::Application.routes.draw do
  root :to => "root#root"
  
  devise_for :users
  
  resources :albums do
    resources :photos, only: [:index]
  end
  
  post 'albums/:id/add_photo',
    to: 'albums#add_photo',
    as: 'add_photo_to_album'
  post 'albums/:id/remove_photo',
    to: 'albums#remove_photo',
    as: 'remove_photo_from_album'
    
  post 'groups/:id/add_photo',
    to: 'groups#add_photo',
    as: 'add_photo_to_group'
  post 'groups/:id/remove_photo',
    to: 'groups#remove_photo',
    as: 'remove_photo_from_group'
      
  resources :friends, only: [:index]
  get 'friends/photos', to: 'friends#photos', as: 'friends_photos'

  resources :groups do
    resource :group_membership, only: [:create, :destroy]
    resources :photos, only: [:index]
  end
  get 'groups/:id/members', to: 'groups#members', as: 'group_members' 
  
  
  resources :photos, only: [:create, :destroy, :new, :show, :update]
    
  resources :users, only: [:show] do
    resources :albums, only: [:index]
    resource  :friendship, only: [:create, :destroy]
    resources :groups, only: [:index]
    resources :photos, only: [:index]
  end
  
end

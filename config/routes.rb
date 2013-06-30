FlickrClone::Application.routes.draw do
  resources :photos
  resources :users
  resource :session
  resources :groups
end

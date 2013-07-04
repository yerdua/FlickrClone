class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.owner = current_user
    
    if @photo.save
      redirect_to photo_url(@photo)
    else
      @errors = @photo.errors.full_messages
      render :new
    end
  end
  
  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(params[:photo])
    
    if @photo.save
      render :json => @photo
    else
      render :json => @photo.errors.full_messages
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
    if (current_user = @photo.owner)
      @albums = current_user.albums
    end
  end
  
  def index
    @photos = User.find(params[:user_id]).photos
  end
end

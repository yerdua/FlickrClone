class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    
    if @photo.save
      redirect_to photo_url(@photo)
    else
      @errors = @photo.errors.full_messages
      render :new
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def index
    @photos = User.find(params[:user_id]).photos
  end
end

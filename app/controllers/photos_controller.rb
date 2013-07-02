class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    
    if @photo.save
      redirect_to photo_url(@photo)
    else
      render :json => @photo.errors.full_messages
    end
  end
  
  def show
    @photo = Photo.find(params[:id])
  end
  
  def index
  end
end

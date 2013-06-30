class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(params[:photo])
    
    if @photo.save
      render :json => @photo
    else
      render :json => "something failed"
    end
  end
end

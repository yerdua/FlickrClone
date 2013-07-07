class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    @albums = user_signed_in? ? current_user.albums : []
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
    @groups = current_user.groups

    if (current_user == @photo.owner)
      @albums = current_user.albums
    end
    
    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @photo }
    end
    
  end
  
  def index
    @photos = User.find(params[:user_id]).photos
  end
end

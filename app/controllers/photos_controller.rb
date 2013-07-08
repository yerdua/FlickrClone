class PhotosController < ApplicationController
  def new
    @photo = Photo.new
    @albums = user_signed_in? ? current_user.albums : []
    @groups = user_signed_in? ? current_user.groups : Group.allow_non_members
  end
  
  def create
    @photo = Photo.new(params[:photo])
    @photo.owner = current_user
    
    if @photo.save
      redirect_to photo_url(@photo)
    else
      @errors = @photo.errors.full_messages
      @albums = user_signed_in? ? current_user.albums : []
      @groups = user_signed_in? ? current_user.groups : Group.allow_non_members
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
    @photo = Photo.find(params[:id], include: :owner)
    @groups = user_signed_in? ? current_user.groups : Group.allow_non_members
    @albums = user_signed_in? && current_user == @photo.owner ? 
      current_user.albums : []
    
    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @photo }
    end
    
  end
  
  def index
    if params[:user_id]
      @user = User.includes(:photos).find(params[:user_id])
      @photos = @user.photos
      @title = "#{@user.name}'s Photostream"
    elsif params[:group_id]
      @group = Group.includes(photos: [:owner]).find(params[:group_id])
      @photos = @group.photos
      @title = @group.name
    elsif params[:album_id]
      @album = Album.includes(:photos).find(params[:album_id])
      @photos = @album.photos
      @title = @album.name
    end
  end
end

class AlbumsController < ApplicationController
  def add_photo
    @album = Album.find(params[:id])
    @album.album_inclusions.build(photo_id: params[:photo_id])

    if @album.save
      render json: @album
    else
      render json: @album.errors.full_messages, status: 422
    end
  end
  
  def remove_photo
    @album = Album.find(params[:id])
    @album.photo_ids -= [params[:photo_id].to_i]
    
    render json: @album
  end
  
  def new
    @album = Album.new
  end

  def create
    @album = Album.create(params[:album])
    @album.owner = current_user
    
    if @album.save
      redirect_to album_url(@album)
    else
      @errors = @album.errors.full_messages
      render :new
    end
  end
  
  def show
    @album = Album.includes(:photos).find(params[:id])
  end
  
  def index
    if (current_user)
      render :json => current_user.albums
    else
      render nil
    end
  end
end

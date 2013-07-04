class AlbumsController < ApplicationController
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

class AlbumInclusionsController < ApplicationController
  def create
    @album_inclusion = AlbumInclusion.new(:photo_id => params[:photo_id],
      :album_id => params[:album_id])
      
    if @album_inclusion.save
      render :json => @album_inclusion
    else
      render :json => @album_inclusion.errors.full_messages
    end
  end
  
  def destroy
    AlbumInclusion.where(params[:id]).destroy
    render nil
  end
  
  # To do:
  # add authorization
end

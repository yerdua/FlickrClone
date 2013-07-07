class GroupsController < ApplicationController
  def add_photo
    @group = Group.find(params[:id])
    @group.photo_shares.build(photo_id: params[:photo_id])

    if @group.save
      render json: @group
    else
      render json: @group.errors.full_messages, status: 422
    end
  end
  
  def remove_photo
    @album = Group.find(params[:id])
    @album.photo_ids -= [params[:photo_id].to_i]
    
    render json: @group
  end
  
  def new
    @group = Group.new
  end    

  def create
    @group = Group.new(params[:group])
    
    if @group.save
      #assume that if a user is logged in, they want to be in this group
      current_user.groups << @group if current_user
      redirect_to @group
    else
      @errors = @group.errors.full_messages
      render :new
    end
  end
  
  def index
    @groups = Group.all
  end
  
  def mine
    @groups = user_signed_in? ? current_user.groups : Group.allow_non_members
  end
  
  def show
    @group = Group.includes(:photos, :members).find(params[:id])
    @photos = @group.photos
    @members = @group.members
  end
  
  def update
    @group = Group.find(params[:id])
    @group.update_attributes(params[:group])
    
    if @group.save
      render :json => @group
    else
      render :json => @group.errors.full_messages
    end
  end
  
end

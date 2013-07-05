class FriendshipsController < ApplicationController
  def create
    if user_signed_in?
      current_user.friend_ids += [params[:user_id]]
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 401
    end
  end
  
  def destroy
    if user_signed_in?
      current_user.friend_ids -= [params[:user_id].to_i]
      render :nothing => true, :status => 200
    else
      render :nothing => true, :status => 401
    end
  end

end

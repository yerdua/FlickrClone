class FriendsController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @user.friends.includes(:recent_photos)
    else
      render :json => "you have no friends because you don't exist"
    end
  end
end

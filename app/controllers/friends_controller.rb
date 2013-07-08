class FriendsController < ApplicationController
  def index
    if user_signed_in?
      @friends = current_user.friends
    else
      render :json => "you have no friends because you don't exist"
    end
  end
  
  def photos
    if user_signed_in?
      @photos = current_user.friends_recent_photos
    else
      render :json => "You're not signed in. While anonymity is awesome,
        there's no way to have a list of friends this way. You can sign up
        without an email address"
    end
  end
end

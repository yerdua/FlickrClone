class UsersController < ApplicationController
  def show
    @user = User.includes(:photos).find(params[:id])
  end

end

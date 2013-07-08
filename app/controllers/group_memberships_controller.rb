class GroupMembershipsController < ApplicationController
  def create
    if user_signed_in?
      membership = current_user.memberships.build(group_id: params[:group_id])
      if membership.save
        render json: membership
      else
        render json: membership.errors, status: 422
      end
    else
      render nothing: true, status: 401
    end
  end
  
  def destroy
    if user_signed_in?
      GroupMembership.where(user_id: current_user.id,
                            group_id: params[:group_id])
                     .destroy_all
      render nothing: true, status: 200
    else
      render nothing: true, status: 401
    end
  end
end

class UsersController < ApplicationController
  def profile
    @user = set_user 
    @user.update(views: @user.views + 1)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end

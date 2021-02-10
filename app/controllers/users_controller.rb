class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @image = @user.image
    @posts = @user.posts
  end
end

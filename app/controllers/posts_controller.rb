class PostsController < ApplicationController
  def index
    @users =User.all
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
end

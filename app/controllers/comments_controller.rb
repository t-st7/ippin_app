class CommentsController < ApplicationController
  before_action :set_post     ,only: [:create, :destroy]
  before_action :authenticate_user! 

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to post_path(@post)
    else
      @comment = Comment.new
      @comments = @post.comments.includes(:user)
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@post), notice: 'コメントを削除しました'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:id])
    
  end
end

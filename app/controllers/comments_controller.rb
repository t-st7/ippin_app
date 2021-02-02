class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user_id, post_id: params[:id])
    
  end
end

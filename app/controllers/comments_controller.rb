class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to blog_path(@comment.article_id)
  end

  private
  def comment_params
    params.permit(:article_id, :text).merge(user_id: current_user.id)
  end

end

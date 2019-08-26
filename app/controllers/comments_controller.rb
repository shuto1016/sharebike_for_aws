class CommentsController < ApplicationController

  before_action :authenticate_user!, only:[:create, :destroy]

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html {redirect_to blog_path(@comment.article_id)}
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    if @comment.user_id == current_user.id
      @comment.destroy
      respond_to do |format|
        format.html {redirect_to blog_path(@comment.article_id)}
        format.json{ render json: @comment}
      end
    end
  end

  private
  def comment_params
    params.permit(:article_id, :text).merge(user_id: current_user.id)
  end

end

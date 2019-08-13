class LikeController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    Like.create(create_params)
  end

  def destroy
    @article = Article.find(params[:id])
    set_like
    if @like.user_id == current_user.id
      @like.destroy
    end
  end


private
def create_params
  params.permit(:article_id).merge(user_id: current_user.id)
end

def set_like
  @like = Like.find_by(user_id: current_user.id, article_id: params[:id])
end



end

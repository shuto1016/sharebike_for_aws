class LikeController < ApplicationController

  def create
    Like.create(create_params)
    redirect_to root_path
  end

  def destroy
    set_like
    if @like.user_id == current_user.id
      @like.destroy
      redirect_to root_path
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

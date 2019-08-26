class UsersController < ApplicationController
  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(id: current_user.id).limit(20)
  end


  def edit
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order("id DESC").page(params[:page]).per(10)
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

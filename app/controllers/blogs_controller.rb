class BlogsController < ApplicationController

  before_action :authenticate_user!, only:[:destroy, :new, :edit]

  def index
    @articles = Article.includes(:user).order('id DESC').page(params[:page]).per(10)
  end

  def new
    @article = Article.new
    2.times { @images = @article.images.build }
  end

  def create
    Article.create(create_params)
    move_to_index
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    set_article
    if @article.user_id == current_user.id
      @article.destroy
    end
    move_to_index
  end

  def edit
    set_article
    unless @article.user_id == current_user.id
      move_to_index
    end

  end

  def update
    set_article
    if @article.user_id == current_user.id
      @article.update(edit_params)
    end
    move_to_index
  end

  def show
    set_article
  end

  private
  def create_params
    params.require(:article).permit(:text, :title, images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:article).permit(:text, :title, images_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index
  end

  def set_article
    @article = Article.find(params[:id])
  end

end

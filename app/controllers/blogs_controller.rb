class BlogsController < ApplicationController

  before_action :authenticate_user!, only:[:destroy, :new, :edit, :update, :create]
  before_action :set_article, only:[:show, :destroy, :edit, :update ]

  def index
    @articles = @q.result(distinct: true).includes(:user).order('id DESC').page(params[:page]).per(5)
  end

  def new
    @article = Article.new
    2.times { @images = @article.images.build }
  end

  def create
    @article = Article.new(create_params)
    if @article.save
      redirect_to root_path, notice: '記事を作成しました'
    else
      redirect_to new_blog_path
    end
  end

  def show
    @comments = @article.comments.includes(:user).order("id ASC")
  end

  def destroy
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to root_path, notice: '記事を削除しました'
    end
  end

  def edit
    unless @article.user_id == current_user.id
      move_to_index
    end

  end

  def update
    if @article.user_id == current_user.id
      @article.update(edit_params)
      redirect_to root_path, notice: '記事を編集しました'
    end
  end

  private
  def create_params
    params.require(:article).permit(:text, :title, maker_ids: [], displacement_ids: [], type_ids: [], images_attributes: [:id, :image]).merge(user_id: current_user.id)
  end

  def edit_params
    params.require(:article).permit(:text, :title, maker_ids: [], displacement_ids: [], type_ids: [], images_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index
  end

  def set_article
    @article = Article.find(params[:id])
  end

end

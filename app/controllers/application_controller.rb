class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?
before_action :ransack_search
before_action :like_ranking



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def ransack_search
    @q = Article.ransack(search_params)
  end

  def like_ranking
    @ranking = Article.find(Like.group(:article_id).order('count(article_id) desc').limit(5).pluck(:article_id))
  end
  
  private
  def search_params
    params.permit(:q)
  end
end

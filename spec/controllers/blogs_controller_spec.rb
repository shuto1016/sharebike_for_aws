require 'rails_helper'

describe BlogsController, type: :controller do

  describe 'GET #new' do
    it "#newが期待するビューに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "#editの@articleは期待した値になること" do
      article = create(:article)
      get :edit, params: { id: article }
      expect(assigns(:article)).to eq article
    end

    it "#editが期待するビューに遷移すること" do
    article = create(:article)
    get :edit, params: { id: article }
    expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "#indexの@articlesは期待した配列になり、作成順で取得できること" do
    articles = create_list(:article, 3) 
    get :index
    expect(assigns(:articles)).to match(articles.sort{ |a, b| a.created_at <=> b.created_at })

    end
    it "#indexが期待するビューに遷移すること" do
    get :index
    expect(response).to render_template :index
    end
  end

end
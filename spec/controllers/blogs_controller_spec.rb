require 'rails_helper'

describe BlogsController, type: :controller do
  let(:user) { create(:user) }
  let(:article) { create(:article, user: user) }


  describe 'GET #new' do
    context 'ログイン時' do
      before do
        login user
        get :new
      end

      it "#newが期待するビューに遷移すること" do
        expect(response).to render_template :new
      end
    end

    context 'ログアウト時' do
      before do
        get :new
      end

      it "#newがログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #edit' do
    context 'ログイン時' do
      before do
        login user
        
        get :edit, params: { id: article }
      end

      it "#editの@articleは期待した値になること" do
        expect(assigns(:article)).to eq article
      end

      it "#editが期待するビューに遷移すること" do
        expect(response).to render_template :edit
      end
    end

    context 'ログアウト時' do
      before do
        get :edit, params: { id: article }
      end

      it "#editがログイン画面にリダイレクトすること" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #index' do
    it "#indexの@articlesは期待した配列になり、作成順で取得できること" do
      articles = create_list(:article, 3) 
      get :index
      expect(assigns(:articles)).to match(articles.sort{ |a, b| b.id <=> a.id })
    end

    it "#indexが期待するビューに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'ログイン時' do
      before do
        login user
      end

      context 'articleの保存に成功した場合' do

      end

      context 'articleの保存に失敗した場合'do
      end
    end

    context 'ログアウト時' do
    end
  end



end

# ログインしているかつ、保存に成功した場合
# articleの保存はできたのか
# 意図した画面に遷移しているか
# ログインしているが、保存に失敗した場合
# articleの保存は行われなかったか
# 意図したビューが描画されているか
# ログインしていない場合
# 意図した画面にリダイレクトできているか

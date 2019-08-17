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
    let(:params) {{user_id: user.id, }}
    
    context 'ログイン時' do
      before do
        login user
      end

      context 'articleの保存に成功した場合' do
        let(:params) { { user_id: user.id, article: attributes_for(:article) } }

        it 'articleの保存が行われた' do
          expect{
            post :create, params: params
        }.to change(Article, :count).by(1)
        end
        
        it 'root画面に遷移しているか' do
          post :create, params: params
          expect(response).to redirect_to(root_path)
        end
      end

      context 'articleの保存に失敗した場合'do
        let(:invalid_params) { { user_id: user.id, article: attributes_for(:article, text: nil, title: nil) } }
     
        it 'articleの保存が行われなかった' do
          expect{
            post :create, params: invalid_params
        }.not_to change(Article, :count)
        end

        it '投稿画面に遷移しているか' do
          post :create, params: invalid_params
          expect(response).to redirect_to(new_blog_path)
        end
      end
    end

    context 'ログアウト時' do
      it 'ログイン画面に遷移しているか' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end


  
  describe 'DELETE #destroy' do
    
    context 'ログイン時' do
      before do
        login user
      end

      context 'articleの削除に成功した場合' do

        it 'articleの削除が行われた' do
          expect{
            delete :destroy, params: { id: article }
        }.to change(Article, :count).by(0)
        end
        
        it 'root画面に遷移しているか' do
          delete :destroy, params: { id: article }
          expect(response).to redirect_to(root_path)
        end
      end

      context 'articleの削除に失敗した場合'do
        let(:user2) { create(:user) }
        let(:article2) { create(:article, user: user2) }
     
        it 'articleの削除が行われなかった' do
          expect{
            delete :destroy, params: { id: article2 }
        }.to change(Article, :count).by(1)
        end

        it 'root画面に遷移しているか' do
          delete :destroy, params: { id: article2 }
          expect(response).to redirect_to(root_path)
        end
      end
    end

    context 'ログアウト時' do
      it 'ログイン画面に遷移しているか' do
        delete :destroy, params: { id: article }
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end


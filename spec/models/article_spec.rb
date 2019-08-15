require 'rails_helper'

describe Article, type: :model do
  describe '#create' do

    context 'articleを保存できる場合' do
      it 'titleとtextがあれば保存できる' do
        article = build(:article)
        expect(article).to be_valid   
      end
    end
    
    context 'articleを保存できない場合' do
      it 'titleがないと保存できない' do
        article = build(:article, title: "")
        article.valid?
        expect(article.errors[:title]).to include("を入力してください")    
      end

      it 'textがないと保存できない' do
        article = build(:article, text: "")
        article.valid?
        expect(article.errors[:text]).to include("を入力してください") 
      end

      it 'user_idが無いと保存できない' do
        article = build(:article, user_id: "")
        article.valid?
        expect(article.errors[:user]).to include("を入力してください") 
      end
    end

  end

end


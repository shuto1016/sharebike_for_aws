require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid   
    end

    it "nicknameが空では登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")    
    end

    it "emailが空では登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")    
    end

    it "passwordが空では登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")    
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    it "nicknameが9文字以上であれば登録できないこと" do
      user = build(:user, nickname: "eeeeeeeee")
      user.valid?
      expect(user.errors[:nickname]).to include("は8文字以内で入力してください")
    end

    it "nicknameが6文字以下では登録できること" do
      user = build(:user, nickname: "eeeeee")
      expect(user).to be_valid   
    end

    it "passwordが6文字以上であれば登録できること" do
      user = build(:user, password: "111111", password_confirmation: "111111")
      expect(user).to be_valid   
    end

    it "passwordが5文字以下であれば登録できないこと" do
      user = build(:user, password: "11111", password_confirmation: "11111")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください") 
    end

    it "重複したnicknameが存在する場合登録できないこと" do
      user1 = create(:user)
      user2 = build(:user, nickname: user1.nickname)
      user2.valid?
      expect(user2.errors[:nickname]).to include("はすでに存在します")    
    end

    it "重複したemailが存在する場合登録できないこと" do
      user1 = create(:user)
      user2 = build(:user, email: user1.email)
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")    
    end

  end
end
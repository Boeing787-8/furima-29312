require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録（ユーザー情報）' do
    it "nameが空だと登録できない" do
      @user.name = ""  # nameの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""  # emailの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "Passwordは6文字以上でなければならない" do

      expect(user.errors.full_messages).to include("Password must be at least 6 characters")
    end

    it "Passwordは半角英数字混合でなければならない" do

      expect(user.errors.full_messages).to include("Password must contain both alphabetic characters and numbers")
    end

    it "Password_confirmationが空では登録できない" do

      expect(user.errors.full_messages).to include("Password_confirmation can't be blank")
    end 
  end

  describe 'ユーザー新規登録（本人情報確認）' do
    it "firsr_nameが空だと登録できない" do
      @user.first_name = ""  # nameの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("First_name can't be blank")
    end

    it "lasr_nameが空だと登録できない" do
      @user.last_name = ""  # nameの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("Last_name can't be blank")
    end

    it "firsr_name_katakanaが空だと登録できない" do
      @user.first_name_katakana = ""  # nameの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("First_name_katakana can't be blank")
    end

    it "last_name_katakanaが空だと登録できない" do
      @user.last_name_katakana = ""  # nameの値を空にする
      @user.valid?
      expect(user.errors.full_messages).to include("Last_name_katakana can't be blank")
    end
end
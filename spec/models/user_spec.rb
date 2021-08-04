require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    it 'ニックネームが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemaiが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが空では登録できないこと' do
      @user.password = ''
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードは6文字以上での入力が必須であること' do
      @user.password = 'aaaa5'
      @user.password_confirmation = 'aaaa5'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードは半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードとパスワード(確認)は、値の一致が必須であること' do
      @user.password = 'aaaaa6'
      @user.password_confirmation = 'aaaaa67'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'お名前(全角)、名字と名前がそれぞれ必須であること' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'お名前(全角)は、全角(漢字・ひらがな・カタカナ)での入力が必須であること' do
      @user.last_name = 'TARO'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'お名前カナ(全角)は、全角(カタカナ)での入力が必須であること' do
      @user.last_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

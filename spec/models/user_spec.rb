require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が出来る時' do
      it '名前が全角（漢字・ひらがな・カタカナ）' do
        @user.first_name = '大'
        expect(@user).to be_valid
      end
      it '名字が全角（漢字・ひらがな・カタカナ）' do
        @user.last_name = '山'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角（カタカナ）' do
        @user.first_name_kana = 'ダイ'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角（カタカナ）' do
        @user.last_name_kana = 'ヤマ'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字混合' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ない時' do
      it 'ニックネームが空欄' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it '名前が全角（漢字・ひらがな・カタカナ）ではない' do
        @user.first_name = 'dai'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Input full-width characters' )
      end
      it '名字が全角（漢字・ひらがな・カタカナ）ではない' do
        @user.last_name = 'yama'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Input full-width characters' )
      end
      it '名前のフリガナが全角（カタカナ）ではない' do
        @user.first_name_kana = '大'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Input full-width katakana characters')
      end
      it '名字のフリガナが全角（カタカナ）ではない' do
        @user.last_name_kana = '山'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Input full-width katakana characters')
      end
      it '生年月日が空欄' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'メールアドレスが空欄' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'パスワードが空欄' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワード（確認）が空欄' do
        @user.password = 'a12345'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end

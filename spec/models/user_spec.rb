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
      it '名字と名前が入力済みかつ、全角（漢字・ひらがな・カタカナ）' do
        @user.last_name = '山'
        @user.first_name = '大'
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
      it '名前と名字が入力済みかつ、フリガナが全角（カタカナ）' do
        @user.first_name_kana = 'ダイ'
        @user.last_name_kana = 'ヤマ'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字混合' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
      it 'emailに@が含まれる' do
        @user.email = 'abc@test'
        expect(@user).to be_valid
      end
    end

    context '新規登録が出来ない時' do
      it 'ニックネームが空欄' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it '名前（全角）が空欄' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(全角)を入力してください')
      end
      it '名字（全角）が空欄' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)を入力してください')
      end
      it '名前（フリガナ）が空欄' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end
      it '名字（フリガナ）が空欄' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)を入力してください')
      end
      it '名前が全角（漢字・ひらがな・カタカナ）ではない' do
        @user.first_name = 'dai'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(全角)は不正な値です')
      end
      it '名字が全角（漢字・ひらがな・カタカナ）ではない' do
        @user.last_name = 'yama'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(全角)は不正な値です')
      end
      it '名前のフリガナが全角（カタカナ）ではない' do
        @user.first_name_kana = '大'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は不正な値です')
      end
      it '名字のフリガナが全角（カタカナ）ではない' do
        @user.last_name_kana = '山'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)は不正な値です')
      end
      it '生年月日が空欄' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end
      it 'メールアドレスが空欄' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'パスワードが空欄' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワード（確認）が空欄' do
        @user.password = 'a12345'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードが半角数字のみ' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上の半角英数字で入力してください')
      end
      it 'パスワードが6文字以上ではない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが半角英字のみ' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上の半角英数字で入力してください')
      end
      it 'パスワードに全角文字が含まれる' do
        @user.password = 'Abcdef'
        @user.password_confirmation = 'Abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上の半角英数字で入力してください')
      end
      it '重複したemailが存在する' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@が含まれない' do
        @user.email = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
    end
  end
end

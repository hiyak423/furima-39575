require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '配送先の登録' do
    context '配送先情報を保存できるとき' do
      it '各項目が正しく入力済み' do
        expect(@order_shipping).to be_valid
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列のとき' do
        @order_shipping.postcode = '123-4566'
        expect(@order_shipping).to be_valid
      end
      it '電話番号が10桁以上11桁以内の半角数値のみのとき' do
        @order_shipping.phone_number = '12345678901'
        expect(@order_shipping).to be_valid
      end
      it '建物名が空欄(入力は任意)' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
    end
    context '配送先情報を保存できないとき' do
      it 'user_idが空欄' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include
      end
      it 'item_idが空欄' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include
      end
      it '郵便番号が空欄' do
        @order_shipping.postcode = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号を入力してください (例)123-4567')
      end
      it '郵便番号にハイフンが含まれていない' do
        @order_shipping.postcode = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号を入力してください (例)123-4567')
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列ではない(1234-5678)' do
        @order_shipping.postcode = '1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号を入力してください (例)123-4567')
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列ではない(123-567)' do
        @order_shipping.postcode = '123-567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号を入力してください (例)123-4567')
      end
      it '郵便番号が半角文字列ではない(全角の場合)' do
        @order_shipping.postcode = '１２３-４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('郵便番号を入力してください (例)123-4567')
      end
      it '都道府県の項目が[---]のとき' do
        @order_shipping.prefecture_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('都道府県名を入力して下さい')
      end
      it '市区町村が空欄' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('市区町村を入力してください')
      end
      it '番地が空欄' do
        @order_shipping.block = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('番地を入力してください')
      end
      it '電話番号が空欄' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号が9桁以下(9桁の場合)' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は数値のみを入力してください')
      end
      it '電話番号が12桁以上(12桁の場合)' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は数値のみを入力してください')
      end
      it '電話番号にハイフンが含まれる' do
        @order_shipping.phone_number = '029-777-777'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は数値のみを入力してください')
      end
      it '電話番号が半角文字列ではない(全角の場合)' do
        @order_shipping.phone_number = '１２３４５６７８９０１'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('電話番号は数値のみを入力してください')
      end
      it 'トークンが空欄' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('クレジットカード情報を入力してください')
      end
    end
  end
end

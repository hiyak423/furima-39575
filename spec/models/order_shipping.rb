require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @order_shipping = FactoryBot.build(:order_shipping, user_id: 1, item_id: 1)
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
      it '番地が空欄' do
        @order_shipping.building = ''
        expect(@order_shipping).to be_valid
      end
      it 'user_idが含まれる' do
        @order_shipping.user_id = 1
        expect(@order_shipping).to be_valid
      end
      it 'item_idが含まれる' do
        @order_shipping.item_id = 1
        expect(@order_shipping).to be_valid
      end
    end
    context '配送先情報を保存できないとき' do
      it 'user_idが空欄' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空欄' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空欄' do
        @order_shipping.postcode = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンが含まれていない' do
        @order_shipping.postcode = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列ではない(1234-5678)' do
        @order_shipping.postcode = '1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列ではない(123-567)' do
        @order_shipping.postcode = '123-567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '郵便番号が半角文字列ではない(全角の場合)' do
        @order_shipping.postcode = '１２３-４５６７'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Postcode is invalid. Enter it as follows (e.g. 123-4567)')
      end
      it '都道府県が空欄' do
        @order_shipping.prefecture_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空欄' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空欄' do
        @order_shipping.block = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空欄' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号が9桁以下(9桁の場合)' do
        @order_shipping.phone_number = '123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号が12桁以上(12桁の場合)' do
        @order_shipping.phone_number = '123456789012'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号にハイフンが含まれる' do
        @order_shipping.phone_number = '029-777-777'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it '電話番号が半角文字列ではない(全角の場合)' do
        @order_shipping.phone_number = '１２３４５６７８９０１'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include('Phone number is invalid. Input only number')
      end
      it 'トークンが空欄' do
        @order_shipping.token = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

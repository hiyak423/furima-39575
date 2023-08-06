require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品情報を保存できるとき' do
      it '各項目が正しく入力済み' do
        expect(@item).to be_valid
      end
    end
    context '商品情報を保存できないとき' do
      it '画像が空欄' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品のカテゴリが空欄' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
      end
      it '商品の状態が空欄' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank", 'Status is not a number')
      end
      it '配送料の負担が空欄' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank", 'Shipping cost is not a number')
      end
      it '発送元の地域が空欄' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it '発送までの日数が空欄' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day is not a number')
      end
      it '価格が空欄' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円より低い' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格が9,999,999円より高い' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it '価格が半角数値のみではない' do
        @item.price = '１1２2'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '選択項目が[---]のとき' do
        @item.category_id = '1'
        @item.status_id = '1'
        @item.shipping_cost_id = '1'
        @item.prefecture_id = '1'
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1', 'Status must be other than 1',
                                                      'Shipping cost must be other than 1', 'Prefecture must be other than 1', 'Shipping day must be other than 1')
      end
    end
  end
end

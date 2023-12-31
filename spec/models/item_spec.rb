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
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end
      it '商品名が空欄' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it '商品の説明が空欄' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it '商品のカテゴリが空欄' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリを入力してください')
      end
      it '商品の状態が空欄' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の詳細を入力してください')
      end
      it '配送料の負担が空欄' do
        @item.shipping_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it '発送元の地域が空欄' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it '発送までの日数が空欄' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it '価格が空欄' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end
      it '価格が300円より低い' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を ¥300〜9,999,999以内で入力してください')
      end
      it '価格が9,999,999円より高い' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を ¥300〜9,999,999以内で入力してください')
      end
      it '価格が半角数値のみではない' do
        @item.price = '１1２2'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を ¥300〜9,999,999以内で入力してください')
      end
      it 'カテゴリーの項目が[---]のとき' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリを入力してください')
      end
      it '商品の状態の項目が[---]のとき' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の詳細を入力してください')
      end
      it '配送料の負担の項目が[---]のとき' do
        @item.shipping_cost_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を入力してください')
      end
      it '発送元の地域の項目が[---]のとき' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を入力してください')
      end
      it '発送までの日数の項目が[---]のとき' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を入力してください')
      end
      it 'ユーザー情報が空欄のとき' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
    end
  end
end

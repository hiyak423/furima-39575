require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    @order_shipping = FactoryBot.build(:order_shipping)
  end

  describe '配送先の登録' do
    context '配送先情報を保存できるとき' do
      it '各項目が正しく入力済み' do
        expect(@order_shipping).to be_valid
      end
    end
  end
end


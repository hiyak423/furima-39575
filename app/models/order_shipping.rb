class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

# バリデーションをかく
  with_options presence :true do
    validates :user_id
    validates :item_id

    validates :postcode
    varidates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number
  end

  def save
  order = Order.create(user_id: user_id, item_id: item_id)

  Shipping.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
  
end


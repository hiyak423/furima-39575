class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token

# バリデーションをかく
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token

    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)'}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number'}
  end

  def save
  order = Order.create(user_id: user_id, item_id: item_id)

  Shipping.create(order_id: order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end
  
end


class Order < ApplicationRecord
  has_one :shipping
  belongs_to :item
  belongs_to :user
end

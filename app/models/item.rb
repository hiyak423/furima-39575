class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :name, :description

    with_options numericality: { other_than: 1 } do
      validates :category_id, :status_id, :shipping_cost_id, :prefecture_id, :shipping_day_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }
    end
  end
end

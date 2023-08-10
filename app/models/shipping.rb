class Shipping < ApplicationRecord
  belongs_to :prefecture
  belongs_to :order  
end

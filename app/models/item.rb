class Item < ApplicationRecord
belongs_to :user
has_one :purchase
has_one_attached :image

with_options presence: true do
  validates :name, :price, :description, :condition, :shipping_charge, :prefecture, :shipping_date, :category
 end 
end
class Item < ApplicationRecord
 belongs_to :user
 has_one :purchase
 has_one_attached :image

 with_options presence: true do
   validates :image
   validates :name, length: { maximum: 40 }
   validates :description, length: { maximum: 1000 }
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }
   validates :category_id
   validates :condition_id
   validates :shipping_charge_id
   validates :prefecture_id
   validates :shipping_date_id
 end 
   
end
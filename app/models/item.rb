class Item < ApplicationRecord
 belongs_to :user
 has_one :purchase
 has_one_attached :image

 extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :shipping_date
  belongs_to :category


 with_options presence: true do
   validates :image
   validates :name, length: { maximum: 40 }
   validates :description, length: { maximum: 1000 }
   validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}, format: { with: /\A[0-9]+\z/ }
   with_options numericality: { other_than: 0, message: "Select" } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_date_id
  end 
 end  
end
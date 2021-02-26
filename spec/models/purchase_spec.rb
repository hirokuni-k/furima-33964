require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it 'user_id、item_id、post_code、prefecture_id、city、phone_number、tokenが存在すれば購入できる' do
        expect(@purchase).to be_valid
      end
    end
  end
    context '商品購入できないとき' do
      it 'user_idが空では登録できない' do
         @purchase.user_id = nil
         @purchase.valid?
         expect(@purchase.errors.full_messages).to include("Image can't be blank")
     end
   end
#       it 'nameが空では登録できない' do
#          @item.name = ""
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Name can't be blank")
#       end
#        it 'priceが空では登録できない' do
#          @item.price = nil
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Price can't be blank")
#        end
#        it 'descriptionが空では登録できない' do
#         @item.description = ""
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Description can't be blank")
#       end
#       it 'condition_idが空では登録できない' do
#          @item.condition_id = nil
#          @item.valid?
#          #binding.pry
#          expect(@item.errors.full_messages).to include("Condition can't be blank")
#       end
#        it 'shipping_charge_idが空では登録できない' do
#          @item.shipping_charge_id = nil
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
#        end
#        it 'prefecture_idが空では登録できない' do
#          @item.prefecture_id = nil
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
#        end
#        it 'shipping_date_idが空では登録できない' do
#          @item.shipping_date_id = nil
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Shipping date can't be blank")
#        end
#        it 'category_idが空では登録できない' do
#          @item.category_id = nil
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Category can't be blank")
#        end
#        it 'category_idが0では登録できない' do
#         @item.category_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Category Select")
#       end
#       it 'condition_idが0では登録できない' do
#         @item.condition_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Condition Select")
#       end
#       it 'shipping_charge_idが0では登録できない' do
#         @item.shipping_charge_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Shipping charge Select")
#       end
#       it 'shipping_date_idが0では登録できない' do
#         @item.shipping_date_id = 0
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Shipping date Select")
#       end
#        it 'priceが299円以下だと登録できない' do
#         @item.price = 299 
#         @item.valid?
#           expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
#       end
#       it 'priceが9,999,999円以上だと登録できない' do
#         @item.price = 10000000
#         @item.valid?
#        # binding.pry
#         expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
#       end
#       it 'priceが半角数字以外だと登録できない' do
#          @item.price = '１１１'
#          @item.valid?
#          expect(@item.errors.full_messages).to include("Price is not a number")
#        end 
#       it 'priceが半角数字と英字だと登録できない' do
#         @item.price = '111aaa'
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price is not a number")
#       end
#       it 'priceが文字だけだと登録できない' do
#         @item.price = 'aaaa'
#         @item.valid?
#         expect(@item.errors.full_messages).to include("Price is not a number")
#       end
#   end 
end
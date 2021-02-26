require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it 'user_id、item_id、post_code、prefecture_id、city、phone_number、tokenが存在すれば購入できる' do
        expect(@purchase_shipping).to be_valid
      end
      it 'building_nameが空でも購入できる' do
        (@purchase_shipping).building_name = ''
        expect(@purchase_shipping).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'user_idが空では購入できない' do
         @purchase_shipping.user_id = nil
         @purchase_shipping.valid?
         expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
    end
      it 'item_idが空では購入できない' do
        @purchase_shipping.item_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'post_codeが空では購入できない' do
        @purchase_shipping.user_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'prefecture_idが空では購入できない' do
        @purchase_shipping.prefecture_id = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture Select")
      end
      it 'cityが空では購入できない' do
        @purchase_shipping.city = ""
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @purchase_shipping.address = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @purchase_shipping.phone_number = nil
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では購入できない' do
        @purchase_shipping.token = nil
        @purchase_shipping.valid?
        #binding.pry
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @purchase_shipping.post_code = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Post code is invalid")
      end
       it 'phone_numberが11桁以内の数値でないと購入できない' do
        @purchase_shipping.phone_number = '000000000000'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
       it 'prefecture_idが0が選択された場合は購入できない' do
        @purchase_shipping.prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Prefecture Select")
      end
       it 'phone_numberにハイフンが含まれている場合は購入できない' do
        @purchase_shipping.phone_number = '090-1111-1111'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
       it 'phone_numberが全角数字の場合は購入できない' do
        @purchase_shipping.phone_number = '０９０１１１１１１１１'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number is invalid")
      end
    end
end
class PurchasesController < ApplicationController
  before_action :set_item,only: [:index,:create]
  before_action :authenticate_user!
  before_action :check_user,only: [:index]
  before_action :sold_out,only: [:index]
  
  def index
    @purchase_shipping = PurchaseShipping.new
  end



  def create
    @purchase_shipping = PurchaseShipping.new(shipping_params)
     if @purchase_shipping.valid?
       pay_item
       @purchase_shipping.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private

  def shipping_params
    params.require(:purchase_shipping).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id,item_id: @item.id, token: params[:token])
  end

  def pay_item
   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]   
   Payjp::Charge.create(
     amount: @item.price,  
     card: shipping_params[:token],    
     currency: 'jpy'                 
   )
  end
  def check_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
   end

  def set_item 
    @item = Item.find(params[:item_id])
  end

  def sold_out
    if Purchase.exists?(item_id: "#{@item.id}")
      redirect_to root_path
    end
  end
end




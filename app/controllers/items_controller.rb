class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
  end


 def new
   @item = Item.new
 end

 def create
  @item = Item.find(item_params)
  if @item.valid?
    @item.save
    redirect_to root_path
  else
    render :new
  end
 end

 def edit
  unless user_signed_in? && current_user.id == @item.user_id
    redirect_to action: :index
  end
 end


def update
  if @item.update(item_params)
    redirect_to item_path 
  else
    render :edit
  end
end


private

 def item_params
  params.require(:item).permit(:name, :image, :price, :description, :condition_id, :shipping_charge_id, :shipping_date_id, :prefecture_id, :category_id).merge(user_id: current_user.id)
 end


 def set_item
   @item = Item.find(params[:id])
 end

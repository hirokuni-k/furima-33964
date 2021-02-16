class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all#includes(:user)
  end


 def new
   @item = Item.new
 end

 def create
  @item = Items.new(item_params)
  if @item.valid?
    @item.save
    redirect_to root_path
  else
    render :new
  end
 end


private

 def item_params
  params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
 end
end
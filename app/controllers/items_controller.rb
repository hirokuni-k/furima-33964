class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    #@items = Item.includes(:user)
  end


 def new
   @items = Item.new
 end

end
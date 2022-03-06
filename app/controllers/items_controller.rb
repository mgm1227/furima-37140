class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
   # @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render 'items/new'
    end
  end
  

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :detail_id, :shipping_cost_id, :prefecture_id, :day_to_ship_id, :item_price).merge(user_id: current_user.id)
  end

end

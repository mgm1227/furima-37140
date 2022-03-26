class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    @item = Item.find(params[:item_id])
    @order_orderhistory = OrderOrderhistory.new
  end
  def create
    @order_orderhistory = OrderOrderhistory.new(order_params)
    if @order_orderhistory.valid?
      @order_orderhistory.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_orderhistory).permit(:post_cord, :prefecture_id, :municipality, :address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

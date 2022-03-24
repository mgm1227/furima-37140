class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
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
    params.require(:order_orderhistory).permit(:post_cord, :prefecture, :municipality, :address, :phone_number).merge(user_id: current_user.id)
  end
end

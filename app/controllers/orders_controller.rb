class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_orderhistory = OrderOrderhistory.new
  end

  def create
    @order_orderhistory = OrderOrderhistory.new(order_params)
    if @order_orderhistory.valid?
      pay_item
      @order_orderhistory.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_orderhistory).permit(:post_cord, :prefecture_id, :municipality, :address, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 秘密鍵
    Payjp::Charge.create(
      amount: @item = Item.find(params[:item_id]).item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

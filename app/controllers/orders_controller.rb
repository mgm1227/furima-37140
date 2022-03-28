class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    @order_orderhistory = OrderOrderhistory.new
    if  @item.order != nil || current_user.id == @item.user_id
      redirect_to items_path
    end
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item = Item.find(params[:item_id]).item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end

class OrdersController < ApplicationController
  before_action :move_to_login
  before_action :set_order, only: [:index, :create]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

private

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def order_params
    params.permit(:post_code, :prefecture_from_id, :city, :house_number, :building_name, :telephone_number, :token, :item_id).merge(user_id: current_user.id)

  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
   Payjp::Charge.create(
    amount: @item.price,
     card: order_params[:token],   # カードトークン
     currency:'jpy'
   )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

end
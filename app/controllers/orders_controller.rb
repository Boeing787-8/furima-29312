class OrdersController < ApplicationController
  before_action :move_to_top, only: [:index]
  before_action :set_item, only: [:index, :create, :move_to_top, :pay_item]
  before_action :authenticate_user!
  before_action :item_id, only: [:move_to_top, :pay_item]
  
  def index
    if user_signed_in? && current_user.id == @item.user_id
      return redirect_to root_path
    else
      @order = OrderAddress.new
    end
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

  def set_item

  end

  def move_to_top
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def item_id
    @item = Item.find(params[:item_id])
  end
end
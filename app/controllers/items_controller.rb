class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :item_find, except: [:index, :new, :create]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit

  end

  def update
    @item.update(item_params)
      redirect_to item_path
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :content, :image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_from_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_find
    @item = Item.find(params[:id])
  end

end
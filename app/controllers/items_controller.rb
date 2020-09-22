class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

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
    @item = Item.find(params[:id])
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
      redirect_to item_path
  end

  #@item = Item.find(params[:id])
  #@item.update(item_params)

  #def destroy
    #@item = Item.find(params[:id])
    #@item.destroy
      #redirect_to root_path
  #end

  private

  def item_params
    params.require(:item).permit(:genre_id, :content, :image, :name, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_from_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
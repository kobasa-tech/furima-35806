class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]

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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :name, :description, :category_id, :item_status_id, :delivery_fee_id, :province_id, :delivery_days_id, :price
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

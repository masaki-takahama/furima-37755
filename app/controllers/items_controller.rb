class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :getItem, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  def edit
    not_seller
  end
  
  def update
    not_seller
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  private
  
  def items_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :product_status_id, :delivery_charge_id,
      :prefecture_id, :shipping_date_id, :image).merge(user_id: current_user.id)
    end
    
    def not_seller
      unless current_user.id == @item.user_id
        redirect_to root_path
      end
  end

  def getItem
    @item = Item.find(params[:id])
  end

end

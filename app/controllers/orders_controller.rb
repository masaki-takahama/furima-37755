class OrdersController < ApplicationController
  def index
    @item = Item.find(params.require(:item_id))
    @order_address = OrderAddress.new
  end
  
  def create
    @item = Item.find(params.require(:item_id))
    @order_address = OrderAddress.new(order_params)
  
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
  params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
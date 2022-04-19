class OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :get_item

  def index
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end

    @order_address = OrderAddress.new
  end
  
  def create
    @order_address = OrderAddress.new(order_params)

     if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private
  
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipalities, :street_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def get_item
    @item = Item.find(params.require(:item_id))
  end


end

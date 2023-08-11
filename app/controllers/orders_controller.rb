class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new
  end
    

  def create
    @item = Item.find(params[:item_id])
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end
    
  private

  def order_params
    params.require(:order_shipping).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

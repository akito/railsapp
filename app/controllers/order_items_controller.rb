class OrderItemsController < ApplicationController
  def create
    order_item = current_cart.order_items.find_or_initialize_by(product_id: params[:product_id])
    order_item.update(quantity: order_item.quantity + 1)

    redirect_to cart_path
  end

  def update
    order_item = current_cart.order_items.find(params[:id])
    if order_item.update(order_item_params)
      redirect_to cart_path
    else
      redirect_to cart_path, alert: 'Unable to update quantity'
    end
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity)
  end
end

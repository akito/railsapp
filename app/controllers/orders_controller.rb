class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def refund
    order = Order.find(params[:id])
    refund = Stripe::Refund.create(
      charge: order.charge_id
    )
    order.update(state: :refunded)
    redirect_to orders_path
  end
end
class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def show
    @order = current_user.orders.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf {
        send_data @order.receipt.render,
                  filename: "Order-##{@order.id}-receipt.pdf",
                  type: "application/pdf",
                  disposition: :inline
        }
      end
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
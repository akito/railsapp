class CheckoutsController <  ApplicationController
  before_action :require_nonempty_card!
  def show
  end

  def create
  end

  private

  def require_nonempty_card!
    redirect_to cart_path if current_cart.order_items.none?
  end
end
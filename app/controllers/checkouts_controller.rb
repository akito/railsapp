class CheckoutsController <  ApplicationController
  before_action :require_nonempty_card!
  def show
  end

  def create
    charge = Stripe::Charge.create(
      amount: current_cart.total,
      currency: 'usd',
      source: params[:stripeToken],
      description: "Oder ##{current_cart.id}"
    )

    current_cart.update(
      charge_id: charge.id,
      state: :paid,
      card_brand: charge.source.brand,
      card_last4: charge.source.last4,
      card_exp_month: charge.source.exp_month,
      card_exp_year: charge.source.exp_year
      )

    redirect_to products_path, notice: 'Your order was completed.'

  rescue Stripe::CardError => e
    flash.alert = e.message
    render action: :show

  rescue Stripe::StripeError => e
    flash.alert = "Something went wrong. #{e.message}"
    render action: :show
  end

  private

  def require_nonempty_card!
    redirect_to cart_path if current_cart.order_items.none?
  end
end
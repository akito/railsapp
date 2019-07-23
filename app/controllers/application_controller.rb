class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_cart

  private

  def current_cart
    return unless current_user
    current_user.orders.draft.first_or_initialize
  end

  def current_user
    @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
  end


end

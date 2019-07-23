class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def total
    quantity * product.amount
  end
end

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: {greater_than_or_equal_to: 0 }
  after_save :destroy_if_zero

  def total
    quantity * product.amount
  end

  private

  def destroy_if_zero
    destroy if quantity.zero?
  end
end

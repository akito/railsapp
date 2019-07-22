class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  scope :draft, -> { where(state: :draft)}
  scope :paid, -> { where(state: :paid)}
  scope :shipped, -> { where(state: :shipped)}
  scope :complete, -> { where(state: :complete)}
  scope :refunded, -> { where(state: :refunded)}
end

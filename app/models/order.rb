# == Schema Information
#
# Table name: orders
#
#  id             :bigint           not null, primary key
#  card_brand     :string
#  card_exp_month :string
#  card_exp_year  :string
#  card_last4     :string
#  paid_at        :datetime
#  state          :string           default("draft"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  charge_id      :string
#  user_id        :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  scope :draft, -> { where(state: :draft)}
  scope :paid, -> { where(state: :paid)}
  scope :shipped, -> { where(state: :shipped)}
  scope :complete, -> { where(state: :complete)}
  scope :refunded, -> { where(state: :refunded)}

  def total
    order_items.map(&:total).sum
  end

  def refundable?
    charge_id? && ! refunded?
  end

  def refunded?
    state === 'refunded'
  end

  def receipt
    Receipts::Receipt.new(
      id: id,
      subheading: "RECEIPT FOR CHARGE #{id}",
      product: "Amazon.com",
      company: {
        name: "Example, Inc.",
        address: "37 Great Jones\nFloor 2\nNew York City, NY 10012",
        email: "test@test.com"
      },
      line_items: [
        ["Date",           paid_at.to_s],
        ["Account Billed", "#{user.name} (#{user.email})"],
        ["Amount",         "$#{total / 100.0}"],
        ["Charged to",     "#{card_brand} (**** **** **** #{card_last4})"],
        ["Transaction ID", id]
      ],
    )
  end
end

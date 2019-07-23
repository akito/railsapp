# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  amount      :integer          default(0), not null
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
end

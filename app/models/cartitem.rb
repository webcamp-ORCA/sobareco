class Cartitem < ApplicationRecord
	belongs_to :product
    belongs_to :customer
   def total_price
		order.to_a.sum { |item| item.total_price }
	end
end



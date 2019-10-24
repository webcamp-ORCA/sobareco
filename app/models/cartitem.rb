class Cartitem < ApplicationRecord
	belongs_to :product
    belongs_to :customer
   def total_price
		order.to_a.sum { |item| item.total_price }
	end
>>>>>>> 5666c0d819195f40b467047c4149ed34cec6cabc
end



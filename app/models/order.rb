class Order < ApplicationRecord
	has_many :order_detail
	belongs_to :customer
	 accepts_nested_attributes_for :customer

	def total_price
		good.price * quantity
	end
    def name
  	last_name + first_name
  end


end

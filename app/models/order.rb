class Order < ApplicationRecord

	has_many :order_detail
	belongs_to :customer
    def name
  	last_name + first_name
  end
    def address
  	prefectures + municipality + address
  end


end

class Delivery < ApplicationRecord
	belongs_to :customer
	belongs_to :prefecture

	
  def homeaddress
    Prefecture.find(prefecture_id).name + municipality + address

  end
end

class Order < ApplicationRecord
	has_many :order_details
	belongs_to :prefecture, optional: true
	belongs_to :customer
	# accepts_nested_attributes_for :customer
     enum delivery_status: {getting_ready: 0, on_passage: 1}
     #チェックボックスが空だったらセーブ
      # validates :settlement_method, acceptance: true
      # validates :addresses, acceptance: true
   #  def name
  	# last_name + first_name
   #  end

def prefecture
    Prefecture.find(prefecture_id).name
  end
def homeaddress
    Prefecture.find(prefecture_id).name + municipality + address

  end

  # def homeaddress
  # 	 Prefecture.find(prefecture_id).name + municipality + address
  # end

end


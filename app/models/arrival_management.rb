class ArrivalManagement < ApplicationRecord
	 belongs_to :product
	 validates :product_id, presence: true
     validates :arrival_date, presence: true
     validates :arrival_count, presence: true
end

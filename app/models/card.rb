class Card < ApplicationRecord
	belongs_to :customer, foreign_key: 'user_id'
	# belongs_to :user, :class_name => "Customer"
end

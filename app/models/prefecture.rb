class Prefecture < ApplicationRecord
  has_many :customers
  has_many :deliveries
end

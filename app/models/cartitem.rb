class Cartitem < ApplicationRecord
    belongs_to :customer
    belongs_to :products
end

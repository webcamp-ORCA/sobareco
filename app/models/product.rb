class Product < ApplicationRecord
  has_many :records, dependent: :destroy
  attachment :product_image
  accepts_nested_attributes_for :records, reject_if: :all_blank, allow_destroy: true
  enum product_status: {on_sale: 0, sold_out: 1}
end

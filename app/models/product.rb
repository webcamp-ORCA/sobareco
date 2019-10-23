class Product < ApplicationRecord
  acts_as_paranoid
  attachment :product_image

  enum product_status: {on_sale: 0, sold_out: 1}

  validates :product_name, presence: true
  validates :product_price, presence: true

  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  has_many :arrival_management
  has_many :cartitems

  has_many :discs, dependent: :destroy
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true

  has_many :discs, dependent: :destroy
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
    def stock
      return 0
    end

end

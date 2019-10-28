class Product < ApplicationRecord
  acts_as_paranoid
  has_many :cartitems
  has_many :customer, through: :cartitems
  has_many :records, dependent: :destroy

  attachment :product_image

  enum product_status: {on_sale: 0, sold_out: 1}

  validates :product_name, presence: true
  validates :product_price, presence: true

  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  has_many :arrival_managements
  has_many :cartitems
  has_many :order_details


  has_many :discs, dependent: :destroy
  accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true


end

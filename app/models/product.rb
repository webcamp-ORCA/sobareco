class Product < ApplicationRecord
  acts_as_paranoid
  has_many :records, dependent: :destroy
  attachment :product_image
  accepts_nested_attributes_for :records, reject_if: :all_blank, allow_destroy: true
  enum product_status: {on_sale: 0, sold_out: 1}
  validates :product_name, presence: true
  validates :artist_id, presence: true
  validates :product_price, presence: true
  validates :label_id, presence: true
  validates :genre_id, presence: true
  belongs_to :artist
  belongs_to :label
  belongs_to :genre

    def stock
      return 0
    end

end

class Disc < ApplicationRecord
  belongs_to :product
  has_many :records, dependent: :destroy
  accepts_nested_attributes_for :records, reject_if: :all_blank, allow_destroy: true
  validates :disc_no, presence: true
end

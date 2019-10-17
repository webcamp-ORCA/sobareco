class Record < ApplicationRecord
  belongs_to :product
  validates :disc_number, presence: true
  validates :song_title, presence: true
end

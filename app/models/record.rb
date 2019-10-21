class Record < ApplicationRecord
  belongs_to :disc
  # validates :song_title, length: { in: 1..50 }

end

class Episode < ApplicationRecord
  belongs_to :video, touch: true
  validates :video, presence: true
  validates :number, presence: true, uniqueness: { scope: :video_id }
end

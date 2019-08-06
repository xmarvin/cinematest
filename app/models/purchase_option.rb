class PurchaseOption < ApplicationRecord
  AVAILABLE_QUALITY = ['hd', 'sd'].freeze

  belongs_to :video, touch: true
  validates :video_quality, :price, presence: true
  validates :video_quality, inclusion: { in: AVAILABLE_QUALITY }
end

class Purchase < ApplicationRecord
  AVAILABLE_QUALITY = ['hd', 'sd'].freeze

  belongs_to :user
  belongs_to :video
  validates :expires_at, :video_quality, :price, presence: true

  validates :video_quality, inclusion: { in: AVAILABLE_QUALITY }
  validate :validate_already_purchased, on: :create, if: -> { user.present? && video.present? }

  scope :active, -> { where('expires_at > now()') }

  private

  def validate_already_purchased
    if user.purchases.active.where(video: video.id).exists?
      self.errors.add(:video, I18n.t('purchase.errors.already_purchased'))
    end
  end

end

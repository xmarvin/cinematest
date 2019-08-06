class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_option
  has_one :video, through: :purchase_option
  validates :expires_at, presence: true
  validate :validate_already_purchased, on: :create, if: -> { user.present? && video.present? }
  scope :active, -> { where('expires_at > now()') }

  private

  def validate_already_purchased
    if user.purchases.active.where(purchase_option_id: video.purchase_options.map(&:id)).exists?
      self.errors.add(:video, I18n.t('purchase.errors.already_purchased'))
    end
  end

end

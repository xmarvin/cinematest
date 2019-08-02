class PurchaseService
  DEFAULT_PRICE = 2.99.freeze
  PURCHASE_DAYS = 2

  def self.perform(user, purchase_options)
    video = Video.find_by(id: purchase_options[:video_id])
    video_quality = purchase_options[:video_quality]
    purchase = Purchase.new(user: user, video: video, expires_at: PURCHASE_DAYS.days.from_now, price: DEFAULT_PRICE, video_quality: video_quality)
    if purchase.valid?
        purchase.save
    end

    purchase
  end
end
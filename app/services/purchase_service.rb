class PurchaseService
  #NOTE: Probably it should be moved to purchase options too
  PURCHASE_DAYS = 2
  def self.perform(user, purchase_options)
    purchase_option = PurchaseOption.find_by(id: purchase_options[:purchase_option_id])
    purchase = Purchase.new(
      user: user,
      purchase_option: purchase_option,
      expires_at: PURCHASE_DAYS.days.from_now
    )
    if purchase.valid?
      #TODO: do charge, and save if success
      purchase.save
    end

    purchase
  end
end
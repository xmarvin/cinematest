class Api::V1::PurchasesController < ApplicationController
  before_action :load_purchase, only: [:show]

  def index
    @purchases = active_purchases
      .paginate(page: params[:page])
      .order('expires_at asc')

    ActiveRecord::Associations::Preloader.new.preload(@purchases.map(&:video).select(&:season?), :episodes)
  end

  def show
  end

  def create
    options = params[:purchase] || {}
    @purchase = PurchaseService.perform(@current_user, options)
  end

  private

  def load_purchase
    @purchase = active_purchases.find_by(id: params[:id])

    if @purchase.nil?
      head :not_found
    end
  end

  def active_purchases
    Purchase.active.where(user: @current_user).includes(:video)
  end

end

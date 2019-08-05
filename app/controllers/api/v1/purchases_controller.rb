class Api::V1::PurchasesController < ApplicationController
  before_action :require_user!
  before_action :load_purchase, only: [:show]

  def index
    @purchases = active_purchases
      .paginate(page: params[:page])
      .order(expires_at: :asc)

    Season.preload_relations(@purchases.map(&:video).select(&:season?))
  end

  def show
  end

  def create
    options = params[:purchase] || {}
    @purchase = PurchaseService.perform(@current_user, options)
    render status: @purchase.persisted? ? :created : :unprocessable_entity
  end

  private

  def load_purchase
    @purchase = active_purchases.find_by(id: params[:id])

    if @purchase.nil?
      head :unauthorized
    end
  end

  def active_purchases
    @current_user.purchases.active.includes(:video)
  end

end

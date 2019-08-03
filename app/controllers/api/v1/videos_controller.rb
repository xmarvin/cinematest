class Api::V1::VideosController < ApplicationController
  def index
    @videos = resources.paginate(page: params[:page]).order(created_at: :desc)

    Season.preload_relations(@videos.select(&:season?))
  end

  def purchase
    options = params[:purchase_options] || {}
    @purchase = PurchaseService.perform(@current_user, options)
  end

  protected

  def resources
    Video
  end
end

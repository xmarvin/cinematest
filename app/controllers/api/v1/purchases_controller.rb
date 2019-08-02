class Api::V1::PurchasesController < ApplicationController
  def create
    options = params[:purchase] || {}
    @purchase = PurchaseService.perform(@current_user, options)
  end
end

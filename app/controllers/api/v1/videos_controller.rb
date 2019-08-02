class Api::V1::VideosController < ApplicationController
  def index
    @videos = resources.paginate(page: params[:page]).order(created_at: :desc)
  end

  protected

  def resources
    Video
  end

end

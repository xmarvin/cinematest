class Api::V1::VideosController < ApplicationController
  def index
    @videos = resources.paginate(page: params[:page]).order(created_at: :desc)


    ActiveRecord::Associations::Preloader.new.preload(@videos.select(&:season?), :episodes)
  end

  protected

  def resources
    Video
  end

end

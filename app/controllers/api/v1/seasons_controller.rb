class Api::V1::SeasonsController < Api::V1::VideosController

  protected

  def resources
    Season
  end
end

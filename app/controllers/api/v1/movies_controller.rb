class Api::V1::MoviesController < Api::V1::VideosController

  protected

  def resources
    Movie
  end
end

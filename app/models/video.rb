class Video < ApplicationRecord
  SEASON_TYPE = 'Season'.freeze
  MOVIE_TYPE = 'Movie'.freeze
  AVAILABLE_TYPES = [SEASON_TYPE, MOVIE_TYPE]

  validates :type, inclusion: { in: AVAILABLE_TYPES }
  validates :title, presence: true, uniqueness: true

  def season?
    self.type == SEASON_TYPE
  end
end

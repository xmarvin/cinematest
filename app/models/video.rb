class Video < ApplicationRecord
  SEASON_TYPE = 'Season'.freeze

  def season?
    self.type == SEASON_TYPE
  end
end

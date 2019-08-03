class Season < Video
  has_many :episodes, foreign_key: :video_id, dependent: :destroy

  def self.preload_relations(seasons)
    ActiveRecord::Associations::Preloader.new.preload(seasons, :episodes)
  end
end
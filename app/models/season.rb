class Season < Video
  has_many :episodes, foreign_key: :video_id, dependent: :destroy
end
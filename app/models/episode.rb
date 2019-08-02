class Episode < ApplicationRecord
  belongs_to :video, touch: true
end

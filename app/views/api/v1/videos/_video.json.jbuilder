json.cache! video do
  json.id video.id
  json.title video.title
  json.plot video.plot
  if video.season?
    json.episodes video.episodes, partial: 'episode', as: :episode
  end
  json.created_at video.created_at
end
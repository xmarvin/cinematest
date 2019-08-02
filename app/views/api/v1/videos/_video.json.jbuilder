json.id video.id
json.title video.title
json.plot video.plot
json.created_at video.created_at

if video.season?
  json.episodes video.episodes do |episode|
    json.cache! episode do
      json.partial! 'episode', episode: episode
    end
  end
end
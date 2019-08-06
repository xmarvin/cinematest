json.id video.id
json.title video.title
json.plot video.plot
json.created_at video.created_at
if with_purchase_options
  json.purchase_options video.purchase_options do |purchase_option|
    json.id purchase_option.id
    json.price purchase_option.price
    json.video_quality purchase_option.video_quality
  end
end
if video.season?
  json.episodes video.episodes do |episode|
    json.cache! episode do
      json.partial! 'api/v1/videos/episode', episode: episode
    end
  end
end
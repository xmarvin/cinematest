json.records @videos do |video|
  json.cache! video do
    json.partial! 'video', video: video
  end
end
json.partial! 'shared/pagination', pagination: @videos
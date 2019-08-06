json.records @videos do |video|
  json.cache! video do
    json.partial! 'video', video: video, with_purchase_options: true
  end
end
json.partial! 'shared/pagination', pagination: @videos
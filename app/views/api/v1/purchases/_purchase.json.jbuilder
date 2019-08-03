json.id purchase.id
json.expires_at purchase.expires_at
json.video_quality purchase.video_quality
json.video do
  json.partial! 'api/v1/videos/video', video: purchase.video
end
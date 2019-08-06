json.id purchase.id
json.expires_at purchase.expires_at
json.video do
  json.partial! 'api/v1/videos/video', video: purchase.video, with_purchase_options: false
end
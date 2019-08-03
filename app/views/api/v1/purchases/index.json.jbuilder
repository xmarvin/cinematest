json.records @purchases do |purchase|
  json.cache! purchase do
    json.partial! 'purchase', purchase: purchase
  end
end
json.partial! 'shared/pagination', pagination: @purchases
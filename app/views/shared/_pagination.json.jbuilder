json.pagination do
  json.current_page @videos.current_page
  json.total_pages @videos.total_pages
  json.per_page @videos.per_page
end
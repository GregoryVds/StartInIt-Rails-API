json.paging do 
  json.current_page   collection.current_page
  json.per_page       collection.per_page
  json.total_pages    collection.total_pages
  json.total_entries  collection.total_entries
end
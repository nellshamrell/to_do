json.array!(@to_do_items) do |to_do_item|
  json.extract! to_do_item, :id, :project_id, :description, :done
  json.url to_do_item_url(to_do_item, format: :json)
end

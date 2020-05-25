json.extract! entry, :id, :entry_name, :list_id, :votes, :created_at, :updated_at
json.url entry_url(entry, format: :json)

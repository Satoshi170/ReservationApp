json.extract! room, :id, :name, :content, :price, :address, :created_at, :updated_at
json.url room_url(room, format: :json)

json.extract! listing, :id, :item_name, :description, :category_id, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)

json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :description, :category, :barcode, :image, :image_type
  json.url item_url(item, format: :json)
end

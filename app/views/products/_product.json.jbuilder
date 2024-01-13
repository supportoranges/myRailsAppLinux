json.extract! product, :id, :internal_code, :detail, :pic, :created_at, :updated_at
json.url product_url(product, format: :json)

json.extract! profile, :id, :company, :department, :address1, :address2, :city, :state, :zip, :country, :website, :status, :referredby, :created_at, :updated_at
json.url profile_url(profile, format: :json)

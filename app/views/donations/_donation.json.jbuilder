json.extract! donation, :id, :name, :address, :email, :pay_type, :created_at, :updated_at
json.url donation_url(donation, format: :json)
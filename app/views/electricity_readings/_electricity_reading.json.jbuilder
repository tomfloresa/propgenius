json.extract! electricity_reading, :id, :subunit_id, :property_id, :period, :total_reading, :created_at, :updated_at
json.url electricity_reading_url(electricity_reading, format: :json)
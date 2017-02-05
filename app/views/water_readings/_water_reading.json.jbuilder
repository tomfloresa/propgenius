json.extract! water_reading, :id, :subunit_id, :property_id, :period, :total_reading, :created_at, :updated_at
json.url water_reading_url(water_reading, format: :json)
class WaterReading < ActiveRecord::Base
  belongs_to :subunit

  def get_consumption_delta
    previous_reading = WaterReading.find_by(period: self.period - 1.month)

    if previous_reading.nil?
      @delta = 0
    else
      @delta = self.total_reading - previous_reading.total_reading
    end
  end
end

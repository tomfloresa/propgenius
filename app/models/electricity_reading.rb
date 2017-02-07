class ElectricityReading < ActiveRecord::Base
  belongs_to :subunit

  def get_consumption_delta
    previous_reading = ElectricityReading.find_by(period: self.period - 1.month)

    if previous_reading.nil?
      @delta = 0
    else
      @delta = self.total_reading - previous_reading.total_reading
    end
  end
end

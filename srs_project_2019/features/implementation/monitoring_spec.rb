class MonitoringSpec
  attr_accessor :humidity
  attr_accessor :time
  def set(humidity, time)
    @humidity = humidity
    @time = time
  end

  def catchHumidity
    40
  end
end

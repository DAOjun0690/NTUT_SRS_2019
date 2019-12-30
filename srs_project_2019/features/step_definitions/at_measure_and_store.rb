Given("Lab1221 has been set up for humidity sensor") do
  @monitoring_spec = MonitoringSpec.new
end

Given("the humidity is taken once every {int} minutes") do |int|
  @interval = int
  expect(@interval).to be(int)
end

Given("Lab1221 has a humidity of <humidity> percent at <time>") do
  t = Time.now
  @monitoring_spec.set(@monitoring_spec.catchHumidity, t.strftime('%H%M'))
end

When("the sensor for Lab1221 begins at {int}:{int}") do |int, int2|
  @hour_begin = Time.now.hour
  @min_begin = Time.now.min
end

When("the sensor for Lab1221 ends at {int}:{int}") do |int, int2|
  @hour_end = Time.now.hour
  @min_end = Time.now.min
  expect(@hour_end - @hour_begin).to be(0)
  expect(@min_end - @min_begin).to be(0)
end

Then("the database should record humidity of {int} percent at {int}:{int} for Lab1221") do |int, int2, int3|
  @hour_end = Time.now.hour
  @min_end = Time.now.min + 1
  expect(@monitoring_spec.catchHumidity).to be(40)
end

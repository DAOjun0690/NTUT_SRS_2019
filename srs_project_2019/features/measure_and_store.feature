Feature: measure and store humidity of each Lab
  As a operator
  In order to measure and store all labs' humidity
  So that Central Air Conditioning System can let environment of all labs comfortably

  Scenario: No failure occurs when measuring the humidity in an interval of time

  Given Lab1221 has been set up for humidity sensor
    And the humidity is taken once every 10 minutes
    And Lab1221 has a humidity of <humidity> percent at <time>
   When the sensor for Lab1221 begins at 9:00
    And the sensor for Lab1221 ends at 9:10
   Then the database should record humidity of 40 percent at 9:11 for Lab1221

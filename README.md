---
title: 'Team_1.md'
disqus: md
---
Team_1
===
###### tags: `2019` `NTUT_CSIE` `SRS` `project`

# Project：Central Air Conditioning System 

Team information
---
陳昭銘 108598065

俞黃淞 107598032

<!-- 陳嘉煜 107598038 -->

王瑄銘 107598045

Problem statement
---
Research building want a central air conditioning system to maintain comfort for each Lab. It should control air volume according to the temperature and humidity of Lab, and it should have screens in the Lab shows current apparent temperature, humidity and air volume.

- Our case describe a central air conditioning system in a research building for controlling each Lab in building are keep in a comfort temperature. According to the requirement above, this system have screens in each Lab to show current apparent temperature, humidity and air volume. The system also provide remote controller for user to setting desired apparent temperature or shutting down usage.



Decompose the problem into subproblems
---
1. measure and store temperature, humidity and air volume of each Lab
2. specify the temperature, humidity and air volume of each Lab 
3. Display current Lab temperature, humidity, and air volume on the screen in each Lab
4. Display all Lab temperature, humidity and air volume on the screen in the central air conditioning system
5. automatically adjust temperature, humidity and air volume of Labs
6. Turn off the power automatically when the Lab not anyone occupied.
7. Lab staff adjust temperature or air volume or humidity.
8. Alarm message to Guard Station if machine is failure. 
 
<!-- 演講內容
We decomposition this problem into four subproblems, which as the following are
1 title -> describe content: each room has a screen shows current apparent temperature, humidity, air volume and target apparent temperature for user.
2 title -> describe content: how system work to auto adjust air volume for each room according to the target apparent temperatue.
3 title -> describe content: how system calculate needed temperature of a room according to the vital fact read by the sensors.
4 title -> describe content: user may use remote controller to set target apparent temperature.
5 title -> describe content: detect if there is no room in use, shut down the air conditioner for energy saving.
in this project, we will focus on the first two subproblems -->


Analysis (e.g., context diagram, problem frame diagrams, shared phenomenon, frame concern, state machine diagram, model domain, etc.)
---
### context diagram
![](https://i.imgur.com/PS7oq8Y.png)

a: CACS !{ Lab ID, Temperature, Humidity, Air Volume, etc. }
b: CACS !{ Turn Up, Turn Down, On, Off }
c: CACS !{ Turn Up, On, Off }
d: CACS !{ Turn Up, Turn Down, On, Off }
e: CACS !{ Lab ID, MaxValue, MinValue, CRUD }
f: R !{ Range }
g: CACS !{ Lab ID, Temperature, Humidity, Air Volume }
h: CACS !{ Temperature, Humidity, Air Volume }
i: LCP  !{ set range }
j: AD !{ Lab ID, Temperature, Humidity, WindVolume, Is Occupied }
k: R !{ Signs of Vital Factor }
l: CACS !{ LabID, errorCode }

### 1. measure and store temperature, humidity and air volume of each Lab
![](https://i.imgur.com/4PpWsh8.png)

a: AD !{ temperature, humidity ,air volume }[Y]
b: L !{ vital factors }[C]
c: MMB !{ modify value of all lab's information } [E]
d: CM !{ MmodelStates } [Y]
e: MM !{ Mmodel } [Y]
f: MMD !{ MmodelStates } [Y]
g: DS !{ store vital factor in DB } [E]
h: D !{ lab's vital factor in DB } [Y]

![](https://i.imgur.com/SZm40i5.png)
![](https://i.imgur.com/FMpluA0.png)



### 2. problem frame diagrams
<!-- Simple workpieces -->
![](https://i.imgur.com/MaqrrEO.png)


a: REM !{ LabID, temperature, air volume, humandity CRUD }[C]
b: LS !{ Initialize the value of LabID and temperature and air volume and humidity }[E]
c: R !{ value of all Lab's information }[Y]

![](https://i.imgur.com/YIBEsj0.png)


### 3. problem frame diagrams
![](https://i.imgur.com/WUYrkoL.png)

a. CM !{ Detect(data) }[Y]
b. DM !{ print(temperatrue, air volume, humidity) }[C]
c. CM !{ catch Temperature, air volume, humidity value of Lab}[C]
d. LCP !{ vital factor }[C]

![](https://i.imgur.com/CwXXUXq.png)

### 4. problem frame diagrams
![](https://i.imgur.com/BxqmuzC.png)

a. IOAL !{ LabID, temperature, air volume, humandity }[C]
b. DM !{print(LabID, temperature, air volume, humandity)}[E]
c. IOAL !{ all Lab's information }[C]
d. CS !{ value of LabID and temperature and air volume and humidity } [Y]

![](https://i.imgur.com/3icu4rk.png)

### 5. problem frame diagrams
![](https://i.imgur.com/kWOxIhI.png)

a: RD !{ CurAirVolume,CurHumidity, CurTemperatrue,LabID }[Y]
b: RD !{ LabID, sensorData  }[Y]
c: MB !{ Mcheck }  [E]
e: MB !{ LabID,machineID,turnUp,turnDown }[E]
f: LAC !{ adjust air Volume }[C]
g: MB !{ MturnUp, MturnDown, LabID,machineID }  [E]
h: RM !{ central condition need to know which lab and machine must turn Up  or turn Down  }[C]
i: RM !{ central condition need a model to  judge current data which is out of range or not } [C] 

![](https://i.imgur.com/WdCdmN3.png)
![](https://i.imgur.com/1VxfTJW.png)

### 6. problem frame diagrams
![](https://i.imgur.com/PLZo30s.png)


a. HD!{ Detect(T) }[C]
b. CACS!{ Power Off, hold the state}[E]
c. HD!{ catch the Thermal Imaging of people }[C]
d. C!{ turn on, turn off}[C]

![](https://i.imgur.com/MqRkIAD.png)

### 7. problem frame diagrams
![](https://i.imgur.com/2vy0PTX.png)

a: LS !{ send TargetTemperature, TargetHumidity, TargetAirVolume }[E]
b: CM !{  temperature,air_volume,humidity }[C]
c. CM !{ pressTemperatureInc, pressTemperatureDec, pressHumidityInc, pressHumidityDec, 
pressAirVolumeInc, pressAirVolumeDec}[C]
d. LS !{ Display value of temperature, air volume, humidity on the screen }[C]

![](https://i.imgur.com/bIepAR8.png)

### 8. problem frame diagrams
![](https://i.imgur.com/RxC1uQN.png)

a:AD!{ temperature,air volume, humidity  }[C]
b:FD!{ Lab ID, errorCode }[C]
c:CS!{ Lab ID, Machine }
d:AD!{ local machine state} [C]

![](https://i.imgur.com/jBL1sr4.png)


### state machine diagram
https://i.imgur.com/RGb4Is6.png
![](https://i.imgur.com/RGb4Is6.png)


### model domain



Recombine the subproblems
---
1. 當lab關閉時，自動調節功能須關閉，
EX:當人類偵測偵測不到人時，便會關閉那間房間的機器，此時正在執行自動調節功能的機器須關閉，不能繼續執行。(problem frame 5,6)
![](https://i.imgur.com/6aIXalD.png)

2. the subproblems have the same display domain.
![](https://i.imgur.com/YpM7Z89.png)

Problem dependency graph
---
1. measure and store temperature, humidity and air volume of each Lab
2. specify the temperature, humidity and air volume of each Lab 
3. Display current Lab temperature, humidity, and air volume on the screen in each Lab
4. Display all Lab temperature, humidity and air volume on the screen in the central air conditioning system
5. automatically adjust temperature, humidity and air volume of Labs
6. Turn off the power automatically when the Lab not anyone occupied.
7. Lab staff adjust temperature or air volume or humidity.
8. Alarm message to Guard Station if machine is failure. 
![](https://i.imgur.com/aWadDuw.png)

User stories
---
Feature: automatically adjust temperature of Lab
  As a Central Air Conditioning System
  In order to adjust Air Condition Compressor state immediately when temperature of Lab changing
  So that Central Air Conditioning System can maintain temperature of Lab

  Scenario: Adjust Air Condition Compressor state immediately when temperature of Lab changing in an interval of time

Gherkin scenarios
---


  Given Lab1221 has been set up for Air Condition Compressor
    And the temperature Range of Lab1221 is from 27 degree C to 28 degree C
    And the Air Condition Compressor of Lab1221 state is 'turnUp' at '9:10'
    And Lab1221 has a temperature of 29 degree C at '9:10'
   When Lab1221 has a temperature of 26 degree C at '9:20'
   Then the Air Condition Compressor of Lab1221 state is 'turnDown' at '9:20'



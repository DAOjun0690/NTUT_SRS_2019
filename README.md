---
title: 'Team_1'
disqus: md
---
Team_1
===
###### tags: `2019` `NTUT_CSIE` `SRS` `project`

# Project：Central Air Conditioning System 

<!-- 教授，各位同學，大家好。我們是第一組 我們要報告的主題是 Central Air Conditioning System 。 -->
<!-- Professor and everyone, good afternoon. We are first team, and our project topic is Central Air Conditioning System.-->
Team information
---
108598065 陳昭銘

107598032 俞黃淞

<!-- 陳嘉煜 107598038 -->

107598045 王瑄銘
<!-- 這試我們的組員，我是宣明王，其他人為 黃松於、昭明陳、? -->
<!-- Here are our team members. My name is 瑄銘王, he is 黃淞俞, 昭明陳, 嘉煜陳.-->
Problem statement
---
This is our problem statement. 
Our motivation is research building want a central air conditioning system to maintain comfort for each lab. 
Each Lab has its own lab control panel with screen which can print current temperature, humidity and air volume of lab. 
The Lab staff can adjust temperature, humidity and air volume through the control panel when he feeling not comfortable.
The central air conditioning system automatically keeps each laboratory at a comfortable temperature defined by each laboratory.
<!--
這是我們的problem statement，我們的動機，Research building want a central air conditioning system to maintain comfort for each Lab.
每一個Lab都有各自的Lab控制面板，它有一個螢幕，可以顯示當前實驗室的溫度、濕度、風量，當實驗室的人員覺得不舒適時，可以透過這panel調整實驗室的溫度、濕度、風量。
同時 中央空調系統會讓買一間實驗室自動保持在每間實驗室所定義的舒適的溫度
-->
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
We decomposition this problem into eight subproblems, which as the following are
1 title -> each Lab have their own specify
4 title -> each Lab has a screen shows current apparent temperature, humidity, air volume and target apparent temperature that Lab staff can check.
5 title -> how system work to auto adjust the vital factor for each Lab according to the target apparent range.
6 title -> detect if there is no anyone in Lab to use 50 minutes, shut down the air conditioner for energy/ˈen.ɚ.dʒi/ saving.
-->


Analysis (e.g., context diagram, problem frame diagrams, shared phenomenon, frame concern, state machine diagram, model domain, etc.)
---
### context diagram
![](https://i.imgur.com/ZM1DOOG.png)

a: CACS !{ Lab ID, Temperature, Humidity, Air Volume, etc. }
b: CACS !{ Turn Up, Turn Down, On, Off }
c: CACS !{ Turn Up, Turn Down, On, Off }
d: CACS !{ Turn Up, Turn Down, On, Off }
e: CACS !{ Lab ID, MaxValue, MinValue, CRUD }
f: R !{ Range }
g: CACS !{ Lab ID, Temperature, Humidity, Air Volume }
h: CACS !{ Temperature, Humidity, Air Volume }
i: LCP  !{ set range }
j: S !{ Lab ID, Temperature, Humidity, WindVolume, Is Occupied }
k: R !{ Signs of Vital Factor }
l: CACS !{ LabID, errorCode }

<!-- This is our context diagram. Each lab has its own sensor detecting temperature...and so on of lab. Sensor delivers values to Central Conditioning Air System. The system stores the values to database and prints on the screen of system. Each value shows on the control panel for each lab, then system will judge the value whether within range. 
If the value is out of range, system adjusts the air condition compressor, dehumidifier and air condition blower. So that the system can maintain all values within the range. 
If the value is out of range, system sends control signal to air condition compressor. System judges Air condition compressor failure when temperature no changing in interval time, then system sends LabID and alarming to Guard Station.

a is a database which stores Lab ID, Temperature, Humidity, Air Volume and so on.
b c d is compressor, dehumidifier, air condition blower will send Turn Up, Turn Down, On, Off signals to it,
e is the Lab ID, MaxValue, MinValue, and we can perform CRUD on it.
f is when the system reads the range of each labo, the model will send the range to the system
g is the current temperature of all lab on the screen of the central air conditioning system
h is the current temperature of each lab on the screen of each lab
i is a lab that adjusts its desired temperature ... to the central air conditioning system
j is the signal that the sensor will send the detected vital factor to the central air-conditioning system, and whether anyone is currently in the laboratory.
L is the central air conditioning system that sends an alert to the guardhouse.
-->

<!-- 這試我們的context diagram，每一間實驗室都有各自的sensor，它會偵測實驗室的溫度等，把偵測到的數值傳送給中央空調系統，中央空調系統會把這些數值儲存到DB，以及顯示到中央控制系統的螢幕上，各實驗室的數值顯示在各實驗室的控制螢幕上，中央空調系統會判斷實驗室的數值是否在range中，如果沒有，會去調整壓縮機、除濕機以及風速機，使數值在range中；
當數值超出range，中央系統法送控制訊號給壓縮機後，溫度過了一段時間沒有變化，我們會猜測壓縮機等出了問題，會發送(LabID,警報)給 Guard Station

a是資料庫 它會儲存Lab ID, Temperature, Humidity, Air Volume and so on.
b c d是 壓縮機 除濕機 風速機 會發送Turn Up, Turn Down, On, Off 訊號給其，
e是系統會發送各實驗室的 ID, MaxValue, MinValue, 我們可以對其做CRUD的動作
f是當系統read各實驗室的range時，該model會傳range給系統
g是顯示全部實驗室當前的溫度在中央空調系統的螢幕上
h是顯示各實驗室當前的溫度在各實驗室的螢幕上
i是個實驗室會調整其想要的溫度...給中央空調系統
j是sensor會發送偵測到的vital factor給中央空調系統，以及當前有沒有人在實驗室中的訊號。
L是中央空調系統會發送警報給警衛室。
-->

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



### 2. specify the temperature, humidity and air volume of each Lab
<!-- Simple workpieces -->
![](https://i.imgur.com/MaqrrEO.png)


a: REM !{ LabID, temperature, air volume, humandity CRUD }[C]
b: LS !{ Initialize the value of LabID and temperature and air volume and humidity }[E]
c: R !{ value of all Lab's information }[Y]

![](https://i.imgur.com/YIBEsj0.png)


### 3. Display current Lab temperature, humidity, and air volume on the screen in each Lab
![](https://i.imgur.com/WUYrkoL.png)

a. CM !{ Detect(data) }[Y]
b. DM !{ print(temperatrue, air volume, humidity) }[C]
c. CM !{ catch Temperature, air volume, humidity value of Lab}[C]
d. LCP !{ vital factor }[C]

![](https://i.imgur.com/CwXXUXq.png)

### 4. Display all Lab temperature, humidity and air volume on the screen in the central air conditioning system
![](https://i.imgur.com/BxqmuzC.png)

a. IOAL !{ LabID, temperature, air volume, humandity }[C]
b. DM !{print(LabID, temperature, air volume, humandity)}[E]
c. IOAL !{ all Lab's information }[C]
d. CS !{ value of LabID and temperature and air volume and humidity } [Y]

![](https://i.imgur.com/3icu4rk.png)

### 5. automatically adjust wind volume, temperature and humandity of each Labs
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

### 6. Turn off the power automatically when the Lab not anyone occupied
![](https://i.imgur.com/PLZo30s.png)


a. HD!{ Detect(T) }[C]
b. CACS!{ Power Off, hold the state}[E]
c. HD!{ catch the Thermal Imaging of people }[C]
d. C!{ turn on, turn off}[C]

![](https://i.imgur.com/MqRkIAD.png)

### 7. Lab staff adjust temperature or air volume or humidity.
![](https://i.imgur.com/tZq6ATy.png)

d. LS !{ pressTemperatureInc, pressTemperatureDec, pressHumidityInc, pressHumidityDec, 
pressAirVolumeInc, pressAirVolumeDec}[E]
a: CM !{ send TargetTemperature, TargetHumidity, TargetAirVolume }[C]
b: LC !{ temperature,air_volume,humidity }[C]
c. LC !{ adjust temperature, air volume, humidity }[C]

![](https://i.imgur.com/1Q8drHf.png)


### 8. Alarm message to Guard Station if machine is failure
![](https://i.imgur.com/RxC1uQN.png)

a:AD!{ temperature,air volume, humidity  }[C]
b:FD!{ Lab ID, errorCode }[C]
c:CS!{ Lab ID, Machine }
d:AD!{ local machine state} [C]

![](https://i.imgur.com/jBL1sr4.png)


### state machine diagram
https://i.imgur.com/RGb4Is6.png
![](https://i.imgur.com/RGb4Is6.png)


### model domain properties
![](https://i.imgur.com/az1cIT3.png)
![](https://i.imgur.com/8MPIuId.png)
![](https://i.imgur.com/Joj0hc3.png)
![](https://i.imgur.com/Vgdu7A0.png)

![](https://i.imgur.com/5NguSbR.png)



Recombine the subproblems
---
1. when lab's machine is in off state,function of adjust temperature, humidity and air volume need to be closed.
![](https://i.imgur.com/6aIXalD.png)

2. the subproblems have the same display domain.
![](https://i.imgur.com/YpM7Z89.png)

3. Before display shows information of current air volume, we must calculate it first according to setted comfort.
![](https://i.imgur.com/QP9Le1F.png)



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

User stories & Gherkin scenarios
---
<!-- And then I will introduce two user stories, one is problem 1: measure and store temperature, humidity and air volume of each Lab, and the other is problem 5: automatically adjust temperature, humidity and air volume of Labs.-->
<!-- One, measure and store temperature, humidity and air volume of each Lab -->

```
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
```
![](https://i.imgur.com/bF46XyS.jpg)

<!-- Two, automatically adjust temperature, humidity and air volume of Labs. -->
<!-- Finally, we used two Gherkin scenarios for two user stories -->
```
Feature: automatically adjust temperature of Lab
  As a Central Air Conditioning System
  In order to adjust Air Condition Compressor state immediately when temperature of Lab changing
  So that Central Air Conditioning System can maintain temperature of Lab
  
  Scenario: Adjust Air Condition Compressor state immediately when temperature 
             of Lab changing in an interval of time
  Given Lab1221 has been set up for Air Condition Compressor
    And the temperature Range of Lab1221 is from 27 degree C to 28 degree C
    And the Air Condition Compressor of Lab1221 state is 'turnUp' at '9:10'
    And Lab1221 has a temperature of 29 degree C at '9:10'
   When Lab1221 has a temperature of 26 degree C at '9:20'
   Then the Air Condition Compressor of Lab1221 state is 'turnDown' at '9:20'
```

---




//控制并发送数据

var MOTOR1_TURN_RIGHT = 1;
 var MOTOR1_TURN_LEFT = 2
 var MOTOR1_SPEED = 3
 var MOTOR1_POS = 4
 var MOTOR1_ORIGIN = 5

//电机2
 var MOTOR2_TURN_RIGHT = 11
 var MOTOR2_TURN_LEFT = 12
 var MOTOR2_SPEED = 13
 var MOTOR2_POS = 14
 var MOTOR2_ORIGIN = 15

//电机3
 var MOTOR3_TURN_RIGHT = 21
 var MOTOR3_TURN_LEFT = 22
 var MOTOR3_SPEED = 23
 var MOTOR3_POS = 24
 var MOTOR3_ORIGIN = 25

//mpu6050
 var MPU6050_ORIGIN = 31

//紧急停止
 var STOP = 41

//标定模式
 var CALIBRATION = 51


//自动模式
 var AUTO_1 = 61
 var AUTO_2 = 62
 var AUTO_3 = 63
 var AUTO_4 = 64
 var AUTO_5 = 65
 var AUTO_6 = 66
 var AUTO_7 = 67

 var MAX = 100


function sendData(mode,data){
    console.log("mode:",mode)
    console.log("data:",data)
    serialtest.sendtoMotor(mode,data)
     console.log("Js send ok")
}

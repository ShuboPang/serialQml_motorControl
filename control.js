
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
 var AUTO_1 = 71

 var MAX = 100


function sendData(mode,data){
    console.log("mode:",mode)
    console.log("data:",data)
    serialtest.sendtoMotor(mode,data)
     console.log("Js send ok")
}

function getErr(error){
    var ret = 0;
//    console.log("error",error)
    switch(Number(error)){
    case 0:
        ret = "无"
        break;
    case 1:
        ret = "系统异常"
        break;

        //电机1
    case 10:
        ret = "电机1运动超过正极限"
        break;
    case 11:
        ret = "电机1运动超过负极限"
        break;
    case 12:
        ret = "电机1目标值超过正极限"
        break;
    case 13:
        ret = "电机1目标值超过负极限"
        break;

        //电机2
    case 20:
        ret = "电机2运动超过正极限"
        break;
    case 21:
        ret = "电机2运动超过负极限"
        break;
    case 22:
        ret = "电机2目标值超过正极限"
        break;
    case 23:
        ret = "电机2目标值超过负极限"
        break;

        //电机3
    case 30:
        ret = "电机3运动超过正极限"
        break;
    case 31:
        ret = "电机3运动超过负极限"
        break;
    case 32:
        ret = "电机3目标值超过正极限"
        break;
    case 33:
        ret = "电机3目标值超过负极限"
        break;
    default:
        ret = "报警错误"
        break;
    }
    return ret
}


//自动任务
var AUTO_CHECK = 1;
var RESET = 2;

//手动任务
var GO_UP = 3;
var GO_LEFT = 4;
var GO_RIGHT = 5;
var GO_DOWN = 6;
var C_STOP = 7;
var FIRE_DOWN = 8;
var FIRE_DOWN_C = 9;


var MAX = 100


function sendData(mode,data){
    console.log("mode:",mode)
    console.log("data:",data)
    serialtest.sendtoMotor(mode,data)
     console.log("Js send ok")
}

function getErr(error){
    var ret = "报警"+Number(error)+"_";
//    console.log("error",error)
    switch(Number(error)){
    case 0:
        ret += "无"
        break;
    case 1:
        ret += "系统异常"
        break;
    case 2:
        ret += "高度未标定"
        break;

        //电机1
    case 10:
        ret += "电机1运动超过正极限"
        break;
    case 11:
        ret += "电机1运动超过负极限"
        break;
    case 12:
        ret += "电机1目标值超过正极限"
        break;
    case 13:
        ret += "电机1目标值超过负极限"
        break;

        //电机2
    case 20:
        ret += "电机2运动超过正极限"
        break;
    case 21:
        ret += "电机2运动超过负极限"
        break;
    case 22:
        ret += "电机2目标值超过正极限"
        break;
    case 23:
        ret += "电机2目标值超过负极限"
        break;

        //电机3
    case 30:
        ret += "电机3运动超过正极限"
        break;
    case 31:
        ret += "电机3运动超过负极限"
        break;
    case 32:
        ret += "电机3目标值超过正极限"
        break;
    case 33:
        ret += "电机3目标值超过负极限"
        break;
    default:
        ret += "状态显示错误"
        break;
    }
    return ret
}

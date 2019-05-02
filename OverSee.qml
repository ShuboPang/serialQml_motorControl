import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import "./ControlQml"


Rectangle{
    id:root
    property alias mpu6050x: mpu6050.xValue
    property alias mpu6050y: mpu6050.yValue
    property alias mpu6050z: mpu6050.zValue
    property alias motor1x: motor1.xValue
    property alias motor1y: motor1.yValue
    property alias motor1z: motor1.zValue
    property alias motor2x: motor2.xValue
    property alias motor2y: motor2.yValue
    property alias motor2z: motor2.zValue
    property alias motor3x: motor3.xValue
    property alias motor3y: motor3.yValue
    property alias motor3z: motor3.zValue

    width: (mpu6050.width+10)*4
    height: mpu6050.height*2 -20
    Column{
        Row{
            spacing: 5
            Mpu6050{
                id:mpu6050
                xValue: "11"
                yValue: "12"
                zValue: "13"
            }
            Motor{
                id:motor1
                title: "Motor1"
                xValue: "13"
                yValue: "14"
                zValue: "15"
            }
        }
        Row{
            spacing: 5
            Motor{
                id:motor2
                title: "Motor2"
                xValue: "13"
                yValue: "14"
                zValue: "15"
            }
            Motor{
                id:motor3
                title: "Motor3"
                xValue: "13"
                yValue: "14"
                zValue: "15"
            }
        }
    }
}

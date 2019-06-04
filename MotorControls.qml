import QtQuick 2.9
import QtQuick.Controls 2.2
import "./ControlQml"

Rectangle {
    id:root
    property alias title: title.text
    width: borderLine.width
    height: borderLine.width +20
    Rectangle{
        id:titleRec
        z:2
        opacity:1
        width:title.width+10
        height: title.height+5
        Text {
            id: title
            x:5
            z:3
            text: "电机控制"
            font.pointSize: 15
        }
    }

    Rectangle{
        id:borderLine
        border.color: "black"
        border.width: 1
        anchors.top: titleRec.top
        anchors.left: titleRec.left
        anchors.topMargin: 7
        anchors.leftMargin : -5
        height: 230
        width: 600
        z:1
        Row{
            x:10
            y:25
            spacing:5
            MotorControl{
                motorId: 1
            }
            MotorControl{
                motorId: 2
            }
            MotorControl{
                motorId:3
            }
        }
    }
}

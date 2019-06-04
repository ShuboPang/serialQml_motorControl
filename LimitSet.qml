import QtQuick 2.9
import QtQuick.Controls 2.2
import "./ControlQml"
import "./control.js" as Control

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
            text: "极限设置"
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
        width: 450
        z:1
        Row{
            x:10
            y:25
            spacing:5
            Column{
                id:motor1
               spacing: 5
               Row{
                   Text {
                       text: qsTr("电机1")
                       font.pointSize: 15
                   }
               }
               Row{
                   Text {
                       text: qsTr("正极限：")
                       font.pointSize: 15
                   }
                   ICLineEdit{
                       id:motor1_P
                       inputWidth: 55
                       height: 25
                       configValue: "0"
                   }
                   ICButton{
                        text:"设置"
                        width: 70
                        onClicked: {
                            Control.sendData(Control.MOTOR1_P_LIMIT,motor1_P.configValue)
                        }
                   }
               }
               Row{
                   Text {
                       text: qsTr("负极限：")
                       font.pointSize: 15
                   }
                   ICLineEdit{
                       id:motor1_N
                       inputWidth: 55
                       height: 25
                       configValue: "10000"
                   }
                   ICButton{
                        text:"设置"
                        width: 70
                        onClicked: {
                            Control.sendData(Control.MOTOR1_N_LIMIT,motor1_N.configValue)
                        }
                   }

               }
               Row{
                   Text {
                       text: qsTr("电机2")
                       font.pointSize: 15
                   }
               }
               Row{
                   Text {
                       text: qsTr("正极限：")
                       font.pointSize: 15
                   }
                   ICLineEdit{
                       id:motor2_P
                       inputWidth: 55
                       height: 25
                       configValue: "0"
                   }
                   ICButton{
                        text:"设置"
                        width: 70
                        onClicked: {
                            Control.sendData(Control.MOTOR2_P_LIMIT,motor2_P.configValue)
                        }

                   }
               }
               Row{
                   Text {
                       text: qsTr("负极限：")
                       font.pointSize: 15
                   }
                   ICLineEdit{
                       id:motor2_N
                       inputWidth: 55
                       height: 25
                       configValue: "10000"
                   }
                   ICButton{
                        text:"设置"
                        width: 70
                        onClicked: {
                            Control.sendData(Control.MOTOR2_N_LIMIT,motor2_N.configValue)

                        }
                   }

               }
            }
            Column{
               id:motor3
               spacing: 5
               Row{
                   Text {
                       text: qsTr("电机3")
                       font.pointSize: 15
                   }
               }
               Row{
                   Text {
                       text: qsTr("正极限：")
                       font.pointSize: 15
                   }
                   ICLineEdit{
                       id:motor3_P
                       inputWidth: 55
                       height: 25
                       configValue: "0"
                   }
                   ICButton{
                        text:"设置"
                        width: 70
                        onClicked: {
                            Control.sendData(Control.MOTOR3_P_LIMIT,motor3_P.configValue)
                        }
                   }
               }
               Row{
                   Text {
                       text: qsTr("负极限：")
                       font.pointSize: 15
                   }
                   ICLineEdit{
                       id:motor3_N
                       inputWidth: 55
                       height: 25
                       configValue: "10000"
                   }
                   ICButton{
                        text:"设置"
                        width: 70
                        onClicked: {
                            Control.sendData(Control.MOTOR3_N_LIMIT,motor3_N.configValue)
                        }
                   }

               }
            }
        }
    }
}

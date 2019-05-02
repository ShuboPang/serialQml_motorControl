import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import "./ControlQml"


Rectangle{
    id:root
    property int motorId:0
    width: 190
    height: 160
    Column{
        spacing: 5
        Row{
            Text {
                id: motorID
                text: qsTr("电机")+motorId
                font.pointSize: 15
            }
        }
        Row{
            Text {
                text: qsTr("脉冲：")
                font.pointSize: 15
            }
            ICLineEdit{
                id:pulse
                inputWidth: 117
                height: 25
                configValue: "10"
            }
        }
        Row{
            ICButton{
                text: "正转"
                width: 90
                onClicked: {

                }
            }
            ICButton{
                text: "反转"
                width: 90
                onClicked: {

                }
            }
        }
        Row{
            Text {
                text: qsTr("位置：")
                font.pointSize: 15
            }
            ICLineEdit{
                id:pulsePos
                inputWidth: pulse.inputWidth
                height: 25
                configValue: "1000"
            }
        }
        Row{
            ICButton{
                text: "运动"
                width: 180
                onClicked: {

                }
            }
        }
        Row{
            Text {
                text: qsTr("速度：")
                font.pointSize: 15
            }
            ICLineEdit{
                id:speed
                inputWidth: 50
                height: 25
                configValue: "10"
            }
            ICButton{
                text: "设置"
                width: 68
                onClicked: {

                }
            }
        }
        Row{

            ICButton{
                text: "设置当前为原点"
                width: 180
                onClicked: {

                }
            }
        }
    }



}

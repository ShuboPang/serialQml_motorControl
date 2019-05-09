import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Particles 2.0
import QtQuick.Controls 2.2


Window {
    width: 300
    height: 120
    title: "屏保时间设定"
    Rectangle{
        Row{
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 8
            spacing: 10
            ICTextInputBox{
                id: name
                label: "屏保时间设定为"
                inputWidth: 120
            }
//            Text {
//                id: name
//                font.pixelSize: 22
//                text: "屏保时间设定为"
//            }
//            ICComboBox{
//                id: set_ssTime
//                configName: " "
//                item: ["1分钟","5分钟","10分钟","30分钟","1小时","从不"]
//            }
        }
        Row{
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 58
            spacing: 50
            ICButton{
                id:sureBtn
                text: "确定"
                onClicked: {
//                    var time;
//                    if(set_ssTime.configValue == 0)
//                        time = 1;
//                    else if(set_ssTime.configValue == 1)
//                        time = 5;
//                    else if(set_ssTime.configValue == 2)
//                        time = 10;
//                    else if(set_ssTime.configValue == 3)
//                        time = 30;
//                    else if(set_ssTime.configValue == 4)
//                        time = 60;
//                    else if(set_ssTime.configValue == 5)
//                        time = 0;
                    if(name.text != " ")
                        ss_time.text = Number(name.text);
                    ss_setWindow.visible = false;
                }
            }
            ICButton{
                id:cancelBtn
                text: "取消"
                onClicked: {
                    ss_setWindow.visible = false;
                }
            }
        }
    }
}

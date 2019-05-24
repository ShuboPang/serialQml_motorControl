import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
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
            text: "自动控制"
            font.pointSize: 15
        }
    }

    function auto_para(){
        Control.sendData(Control.AUTO_1+6,autoSpeed.configValue);
        Control.sendData(Control.AUTO_1+7,comeBack.configValue);
        Control.sendData(Control.AUTO_1+8,cycle.configValue);
        Control.sendData(Control.AUTO_1+9,cycleTimes.configValue);
        Control.sendData(Control.AUTO_1+10,symmetry.configValue);
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
            spacing: 10
            Column{
                spacing:5
                Row{
                    Text {
                        text: qsTr("1.固定高度：")
                        font.pointSize: 15
                    }
                    ICLineEdit{
                        id:height
                    }
                    ICButton{
                        text: "运行"
                        onClicked: {
                            auto_para()
                            Control.sendData(Control.AUTO_1,height.configValue);

                        }
                    }
                }
                Row{
                    Text {
                        text: qsTr("2.固定角度：")
                        font.pointSize: 15
                    }
                    ICLineEdit{
                        id:angle
                    }
                    ICButton{
                        text: "运行"
                        onClicked: {
                            auto_para()
                            Control.sendData(Control.AUTO_1+1,angle.configValue);
                        }
                    }
                }
                Row{
                    Text {
                        text: qsTr("3.固定长度：")
                        font.pointSize: 15
                    }
                    ICLineEdit{
                        id:distance
                    }
                    ICButton{
                        text: "运行"
                        onClicked: {
                            auto_para()
                            Control.sendData(Control.AUTO_1+2,distance.configValue);

                        }
                    }
                }
                Row{
                    Text {
                        text: qsTr("4.任意点")
                        font.pointSize: 15
                    }
                   Text {
                       text: qsTr("X:")
                       font.pointSize: 15
                   }
                    ICLineEdit{
                        id:x
                    }
                    Text {
                        text: qsTr("Y:")
                        font.pointSize: 15
                    }
                    ICLineEdit{
                        id:y
                    }
                    ICButton{
                        text: "运行"
                        onClicked: {
                            auto_para()
                            Control.sendData(Control.AUTO_1+3,0);

                        }
                    }
                }
                Row{
                    Text {
                        text: qsTr("5.画圆半径：")
                        font.pointSize: 15
                    }
                    ICLineEdit{
                        id:r
                    }
                    ICButton{
                        text: "运行"
                        onClicked: {
                            auto_para()
                           Control.sendData(Control.AUTO_1+4,r.configValue);

                        }
                    }
                }
                Row{
                    Text {
                        text: qsTr("6.轨迹")
                        font.pointSize: 15
                    }
                    ICButton{
                        text: "运行"
                        onClicked: {
                            auto_para()
                            Control.sendData(Control.AUTO_1+5,r.configValue);
                        }
                    }
                }
            }
            Column{
                spacing: 10
                Row{
                    ICInputBox{
                        id:autoSpeed
                        configName: "全局速度："
                        configValue: "5"
                        onConfigValueChanged: {
                            Control.sendData(Control.AUTO_1+6,autoSpeed.configValue);
                        }
                    }
                }
                Row{
                    ICCheckbox{
                        id:comeBack
                        configName: "是否返回"
                        onConfigValueChanged: {
                             Control.sendData(Control.AUTO_1+7,comeBack.configValue);
                        }

                    }
                }
                Row{
                    ICCheckbox{
                        id:cycle
                        configName: "是否循环"
                        onConfigValueChanged: {
                             Control.sendData(Control.AUTO_1+8,cycle.configValue);
                        }
                    }
                }
                Row{
                    ICInputBox{
                        id:cycleTimes
                        configName: "循环次数："
                        configValue: "3"
                        enabled: cycle.configValue
                        onConfigValueChanged: {
                             Control.sendData(Control.AUTO_1+9,cycleTimes.configValue);
                        }
                    }
                }
                Row{
                    ICCheckbox{
                        id:symmetry
                        configName: "是否对称"
                        enabled: cycle.configValue
                        onConfigValueChanged: {
                             Control.sendData(Control.AUTO_1+10,symmetry.configValue);
                        }
                    }
                }

            }

        }
    }
}

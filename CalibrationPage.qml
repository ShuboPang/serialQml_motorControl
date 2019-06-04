import QtQuick 2.9
import QtQuick.Controls 2.2
import "./ControlQml"
import "./control.js" as Control

Rectangle {
    id:root
    property alias title: title.configName
    property string currentPos: ""
    width: borderLine.width
    height: borderLine.width
    Rectangle{
        id:titleRec
        z:2
        opacity:1
        width:title.width+70
        height: title.height+5
        Row{
            spacing: 20
            ICComboBox{
                id:title
                configName: "标定"
                item:["标定结构参数","标定重力参数"]
                inputWidth:150
                onConnfigValueChanged: {
                    if(connfigValue == 0){
                        struct.visible = true
                        mpu6050.visible = false
                    }
                    else if(connfigValue == 1){
                        struct.visible = false
                        mpu6050.visible = true
                    }
                    else{
                        struct.visible = false
                        mpu6050.visible = false
                    }
                }
            }
            ICButton{
                text: "计算"
                onClicked:{

                }
            }
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
        Column{
            id:struct
            spacing: 5
            x:10
            y:27
            RunState{
                comnfigName:"1.移动到高度为5cm处并保持平衡"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"2.移动到高度为10cm处并保持平衡"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+1,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"3.移动到高度为15cm处并保持平衡"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+2,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"4.移动到高度为20cm处并保持平衡"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+3,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"5.移动到高度为25cm处并保持平衡"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+4,0);
                    state = true
                }
            }
        }
        Column{
            id:mpu6050
            spacing: 5
            x:10
            y:20
            visible: false
            RunState{
                comnfigName:"1.30°方向倾斜到半径为50cm处"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+5,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"2.30°方向倾斜到半径为10cm处"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+6,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"3.30°方向倾斜到半径为15cm处"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+7,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"4.60°方向倾斜到半径为10cm处"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+8,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"5.120°方向倾斜到半径为10cm处"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+9,0);
                    state = true
                }
            }
            RunState{
                comnfigName:"6.150°方向倾斜到半径为10cm处"
                state:false
                btOKName: "设入"
                btCancelName: "设入"
                onBtClick: {
                    Control.sendData(Control.CALIBRATION+10,0);
                    state = true
                }
            }
        }
    }
}

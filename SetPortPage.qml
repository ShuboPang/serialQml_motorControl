import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
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
            text: "串口设置"
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
        height: 280
        width: 200
        z:1
        Column{
            id:setPort
            spacing: 5
            x:10
            y:20
            ICComboBox{
                id:port
                configName:"端口号:"
                item: ["COM1","COM2","COM3","COM4","COM5","COM6","COM7","COM8","COM9","COM10","COM11","COM12","COM13","COM14","COM15"]
            }
            ICComboBox{
                id:baudRate
                configName:"波特率:"
                item: ["9600","19200","38400","115200"]
            }
            ICComboBox{
                id:dataBits
                configName:"数据位:"
                item: ["5","6","7","8"]
            }
            ICComboBox{
                id:checkDigit
                configName:"校验位:"
                item: ["无","1","2"]
            }
            ICComboBox{
                id:stopBits
                configName:"停止位:"
                item: ["1","1.5","2"]
            }
            ICComboBox{
                id:flowControl
                configName:"流控制:"
                item: ["无","硬件","软件"]
            }
            RunState{
                id:run
                comnfigName: "状态"
                state: false
                btOKName: "打开串口"
                btCancelName: "关闭串口"
                onBtClick: {
                    if(!state){
                        var ret = serialtest.openAndSetPort(port.connfigValue,baudRate.connfigValue,dataBits.connfigValue,checkDigit.configValue,stopBits.connfigValue,flowControl.connfigValue);
                        if(ret === 0){
                           state = true
                        }
                        else{
                            portError.visible = true
                        }
                    }
                    else{
                        state = false
                        serialtest.closePort();
                    }
                }
            }
        }
    }
}

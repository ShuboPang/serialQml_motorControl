import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import "./ControlQml"

ApplicationWindow {
    visible: true
    width: 1080
    height: 615
    title: qsTr("串口调试助手--匿了名的米老鼠")
    Column{
        spacing: 10
        Row{
            x:10
            y:10
            spacing : 10
            Column{
                SetPortPage{
                    id:setPortPage
                }
            }
            Column{
                id:portDataShow
                spacing: 10
                ICTextEdit{
                    id:recvDataShow
                    configName: "接  收:"
                    inputHeight: 140
                    inputWidth:  400
                    inputText: {
                        var arr = serialtest.receivedata.split("#")
                        var ret ;
                        if(arr[arr.length-1].split(",").length !== 8)
                        {
                            ret = arr[arr.length-2]+""
                        }
                        else
                        {
                            ret = arr[arr.length-1]+""
                        }
                        setValue(ret)
                        return ret;
                    }

                    inputCount:serialtest.receivenumber
                    onClickClear: {
                        serialtest.receivedata=""
                        serialtest.sendnumber="0"
                        serialtest.receivenumber="0"
                        serialtest.clearnumber();
                    }


                    function setValue(array){
                        var tmp = array.split(",")
                        if(tmp.length !==8 ){
                            return ;
                        }
                        if(tmp[0] != "123" || tmp[tmp.legth-1] != "321"){
                            return
                        }
                        if(tmp[1] == "124"){
                            oversee.motor1x = tmp[2];
                            oversee.motor1y = tmp[3];
                            oversee.motor1z = tmp[4];
                        }
                        else if(tmp[1] == "125"){
                            oversee.motor2x = tmp[2];
                            oversee.motor2y = tmp[3];
                            oversee.motor2z = tmp[4];
                        }
                        else if(tmp[1] == "164"){
                            oversee.motor3x = tmp[2];
                            oversee.motor3y = tmp[3];
                            oversee.motor3z = tmp[4];
                        }
                    }
                }
                ICTextEdit{
                    id:sendDataShow
                    configName: "发  送:"
                    inputHeight: recvDataShow.inputHeight
                    inputWidth:  recvDataShow.inputWidth
                    isSend: true
                    inputText: ""
                    onClickClear: {
                        inputText = ""
                    }
                    onSendData: {
                        serialtest.sendto(inputText)
                    }
                }
            }
            Column{
                OverSee{
                    id:oversee
                }
            }
         }
        Row{
            spacing: 10
            ICComboBox{
                id:currentMode
                configName:"模式："
                item: ["标定","手动","自动"]
                onConnfigValueChanged: {
                    if(connfigValue == 0){
                        calibrationPage.visible = true
                        motorControls.visible = true
                        autoControls.visible = false
                        motor1Orign.visible = true
                    }
                    else if(connfigValue == 1){
                        calibrationPage.visible = false
                        motorControls.visible= true
                        autoControls.visible = false
                        motor1Orign.visible = false
                    }
                    else if(connfigValue == 2){
                        calibrationPage.visible = false
                        motorControls.visible = false
                        autoControls.visible = true
                        motor1Orign.visible = false
                    }
                }
            }
            ICButton{
                id:motor1Orign
                text: "电机1设为原点"
                width: 170
                onClicked: {

                }
            }
            ICButton{
                id:motor2Orign
                text: "电机2设为原点"
                width:motor1Orign.width
                visible: motor1Orign.visible
                onClicked: {

                }
            }
            ICButton{
                id:motor3Orign
                text: "电机3设为原点"
                width:motor1Orign.width
                visible: motor1Orign.visible
                onClicked: {

                }
            }
            ICButton{
                id:mpu6050Orign
                text: "陀螺仪设为原点"
                width:motor1Orign.width
                visible: motor1Orign.visible
                onClicked: {

                }
            }
            ICButton{
                id:stop
                text: "紧急停止"
                onClicked: {

                }
            }
            ICSurveillance{
                id:error
                configName: "报警："
                configValue: "无"
                visible: !motor1Orign.visible
            }
        }
        Row{
            x:10
            Rectangle{
                id:controlPage
                width: 1050
                height: 250
                Row{
                    spacing: 10
                    CalibrationPage{
                        id:calibrationPage
                        width: 450
                        height: 230
                    }
                    MotorControls{
                        id:motorControls
                        width: 500
                        height: 230
                    }
                    AutoControls{
                        id:autoControls
                        width: 1000
                        height: 230
                    }
                }
            }
        }
    }
    Message{
        id:portError
        message: "串口打开失败！"
        z:999
        anchors.centerIn: parent
        visible: false
    }
}

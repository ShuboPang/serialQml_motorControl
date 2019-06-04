import QtQuick 2.9
import QtQuick.Controls 2.2
import "./ControlQml"
import "./control.js" as Control

ApplicationWindow {
    id: mainRec
    visible: true
    width: 760
    height: 615
    title: qsTr("STM32智能消防车控制监测系统")
    onVisibleChanged: {
        screenTime1.start();
        longerStatus.progress25 = true;
    }
    function setValue(array){
        var tmp = array.split(",")
        if(tmp.length !==8 ){
            return ;
        }
        if(tmp[1] == "1"){
            e_machine0.yValue = tmp[3];
            e_machine2.yValue = tmp[3];
            e_machine1.yValue = tmp[3];
            e_machine3.yValue = tmp[3];
            fire_ck.yValue = tmp[4] == 1?"检测到":"未检测到";
            fire_ck.yValue = tmp[4] == 1?"是":"否";
//            oversee.motor1y = tmp[3];
//            oversee.motor1z = tmp[4];
        }
        else if(tmp[1] == "2"){
            oversee.motor2x = tmp[2];
//            oversee.motor2y = tmp[3];
//            oversee.motor2z = tmp[4];
        }
        else if(tmp[1] == "3"){
            oversee.motor3x = tmp[2];
//            oversee.motor3y = tmp[3];
//            oversee.motor3z = tmp[4];
        }
        else if(tmp[1] == "4"){
            oversee.mpu6050x = (Number(tmp[2])/32768*180).toFixed(3);
//            oversee.mpu6050y = (Number(tmp[3])/32768*180).toFixed(3);
//            console.log(tmp[4])
//            oversee.mpu6050z = (Number(tmp[4])/10).toFixed(1);
        }
        else if(tmp[1] == "5"){
            error.configValue = Control.getErr(tmp[2])
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            screenSafeRun.stop();
            screenSafeRun.start();
            if(!mainWindow.visible)
            {
                mainWindow.visible = true;
                screenSafer.visible = false;
            }
        }
    }
    Rectangle{
        id: screenStart
        anchors.centerIn: parent
        Image {
            id: screenShop
            source: "./image/panda.png"
            anchors.centerIn: parent
        }
        ICProgressBar{
            id: longerStatus
            anchors.left: parent.left
            anchors.leftMargin: 0
        //            anchors.leftMargin: -125
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -350
        //            anchors.bottomMargin: -300
        }
        Text {
            id: screenLoader
            text: qsTr("Loading...")
            anchors.left: parent.left
            anchors.leftMargin: -35
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -250
        }
        Timer{
             id: screenTime1
             repeat: false;
             interval: 300;
             onTriggered: {
                 screenLoader.text = qsTr("程序初始化...")
                 longerStatus.progress25 = false;
                 longerStatus.progress50 = true;
                 screenTime2.start();
             }
        }
        Timer{
             id: screenTime2
             repeat: false;
             interval: 300;
             onTriggered: {
                 screenLoader.text = qsTr("蓝牙通信初始化...")
                 longerStatus.progress50 = false;
                 longerStatus.progress75 = true;
                 screenTime3.start();
             }
        }
        Timer{
             id: screenTime3
             repeat: false;
             interval: 200;
             onTriggered: {
                 screenLoader.text = qsTr("系统自检中...")
                 longerStatus.progress50 = false;
                 longerStatus.progress75 = true;
                 screenTime4.start();
             }
        }
        Timer{
             id: screenTime4
             repeat: false;
             interval: 400;
             onTriggered: {
                 screenLoader.text = qsTr("应用初始化中...")
                 longerStatus.progress75 = false;
                 longerStatus.progress100 = true;
                 screenTime5.start();
             }
        }
        Timer{
             id: screenTime5
             repeat: false;
             interval: 300;
             onTriggered: {
                 longerStatus.visible = false;
                 screenLoader.visible = false;
                 screenShop.visible = false;
                 mainWindow.visible = true;
//                 reflashData.start();
//                 if(Number(ss_time.text) != 0)
//                    screenSafeRun.start();
             }
        }
        Timer{
             id: screenSafeRun
             repeat: false;
//             interval: (60000*Number(ss_time.text));
             onTriggered: {
                // mainWindow.visible = false;
                 //screenSafer.visible = true;
             }
        }
        Timer{
             id: reflashData
             repeat: true;
             interval: 1000;
             onTriggered: {
                 com_text.xValue = whichCom.text;
                 com_text.yValue = whichBaudRate.text;
             }
        }
    }
    ICScreenSafer{
        id: screenSafer
        visible: false
    }
    Column{
        id: mainWindow
        spacing: 10
        visible: false
        Row{
            x:10
            y:10
            spacing : 10
            Rectangle{
                width: 200
                height: 240
                ICClock{
                }
                Rectangle{
                    id:sf_text
                    visible: false
                    Text {
                        id: whichCom
                        text: "COM4"
                    }
                    Text {
                        id: whichBaudRate
                        text: "9600"
                    }
                    Text {
                        id: portText
                        text: "13"
                    }
                    Text {
                        id: baudRatetext
                        text: "3"
                    }
                    Text {
                        id: dataBitstext
                        text: "3"
                    }
                    Text {
                        id: checkDigittext
                        text: "0"
                    }
                    Text {
                        id: stopBitstext
                        text: "0"
                    }
                    Text {
                        id: flowControltext
                        text: "0"
                    }
                }
                ICButton{
                    id: configRun
                    text: "配置串口"
                    width: 200
                    anchors.bottom: run.top
                    anchors.bottomMargin: 5
                    onClicked: {
                        serialLoader.visible = true;
                    }
                }
                RunState{
                    id:run
//                    width: serialSet.width
//                    height: serialSet.height
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin:-55
                    comnfigName: "状态"
                    state: false
                    btOKName: "打开串口"
                    btCancelName: "关闭串口"
                    onBtClick: {
                        if(!state){
                            var ret = serialtest.openAndSetPort(Number(portText.text),
                                                                Number(baudRatetext.text),
                                                                Number(dataBitstext.text),
                                                                Number(checkDigittext.text),
                                                                Number(stopBitstext.text),
                                                                Number(flowControltext.text));
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
                        console.log("srecv",serialtest.receivedata)
                        if(arr[arr.length-1].split(",").length !== 8 || arr[arr.length-1].split(",")[0] != "123" || arr[arr.length-1].split(",")[7] != "321")
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
        }
        Row{
            id: nowModeStatus
            anchors.left: parent.left
            anchors.leftMargin: 10
            spacing: 25
            Row{
                Image {
                    id: run_mg1
                    source: "./image/check.png"
                    width: 25
                    height: 25
                }
                Text {
                    id: run_status
                    font.pixelSize: 20
                    text: "当前任务:待机"
                }
            }
            Row{
                Image {
                    id: run_mg2
                    source: "./image/check.png"
                    width: run_mg1.width
                    height: run_mg1.height
                }
                Text {
                    id: can_status
                    font.pixelSize: 20
                    text: "通信状态:良好"
                }
            }
            Row{
                Image {
                    id: run_mg3
                    source: "./image/check.png"
                    width: run_mg1.width
                    height: run_mg1.height
                }
                Text {
                    id: fireDone_status
                    font.pixelSize: 20
                    text: "灭火器状态:良好"
                }
            }
            Row{
                Image {
                    id: run_mg4
                    source: "./image/check.png"
                    width: run_mg1.width
                    height: run_mg1.height
                }
                Text {
                    id: dynamo_status
                    font.pixelSize: 20
                    text: "车辆状态:良好"
                }
            }
        }
        Row{
            spacing: 23
            anchors.left: parent.left
            anchors.leftMargin: 10
            Column{
                spacing: 5
                ICComboBox{
                    id:currentMode
                    configName:"模式："
                    item: ["手动","自动"]
                    onConfigValueChanged: {
                        o_manualMove.visible = false
                        c_manualMove.visible = false;
                        showControl.visible = false;
                        showMessagebox.width = 543;
                        observe.visible = true;
                        if(configValue == 0){
                            c_manualMove.visible = true;
                            manualMode.visible = true;
                            autoMode.visible = false;
                        }
                        else{
                            showMessagebox.width = 543;
                            manualMode.visible = false;
                            autoMode.visible = true;
                        }
                    }
                }
                ICButton{
                    id: s_screenSafer
                    text: "开启屏保"
                    height: 35
                    width: 160
                    onClicked: {
                        mainWindow.visible = false;
                        screenSafer.visible = true;
                    }
                }
                ICButton{
                    id: set_time
                    text: "设置屏保时间"
                    height: 35
                    width: 160
                    onClicked: {
                        ss_setWindow.visible = true;
                    }
                }
                ICButton{
                    id: show_serialText
                    text: "显示串口信息"
                    height: 35
                    width: 160
                    onClicked: {
                        com_text.visible = true;
                        visible = false;
                        un_show_serialText.visible = true;
                    }
                }
                ICButton{
                    id: un_show_serialText
                    visible: false
                    text: "隐藏串口信息"
                    height: 35
                    width: 160
                    onClicked: {
                        com_text.visible = false;
                        visible = false;
                        show_serialText.visible = true;
                    }
                }
                Text {
                    id: ss_time
                    visible: false
                    text: "1"
                }
                Column{
                    id: manualMode
                    visible: true
                    spacing: 5
                    ICButton{
                        id: m_fireDone
                        text: "手动灭火"
                        height: 35
                        width: s_screenSafer.width
                        visible: true
                        onClicked: {
                            run_status.text = "当前任务:手动灭火"
                            visible = false;
                            z_fireDone.visible = true;
                            Control.sendData(Control.FIRE_DOWN,1);
                        }
                    }
                    ICButton{
                        id: z_fireDone
                        text: "停止灭火"
                        height: 35
                        width: s_screenSafer.width
                        visible: false
                        onClicked: {
                            visible = false;
                            m_fireDone.visible = true;
                            run_status.text = "当前任务:灭火完成"
                            Control.sendData(Control.FIRE_DOWN_C,1);
                        }
                    }
                    ICButton{
                        id: c_manualMove
                        visible: true
                        text: "开启手动控制"
                        height: 35
                        width: s_screenSafer.width
                        onClicked: {
                            visible = false;
                            o_manualMove.visible = true;
                            showControl.visible = true;
                            showMessagebox.width = 325;
                            observe.visible = false;
                        }
                    }
                    ICButton{
                        id: o_manualMove
                        visible: false
                        text: "关闭手动控制"
                        height: 35
                        width: s_screenSafer.width
                        onClicked: {
                            visible = false;
                            c_manualMove.visible = true;
                            showControl.visible = false;
                            showMessagebox.width = 543;
                            observe.visible = true;
                        }
                    }
                }

                Column{
                    id: autoMode
                    visible: false
                    spacing: 5
                    ICButton{
                        id: wait_fire
                        text: "区域监测"
                        height: 35
                        width: s_screenSafer.width
                        visible: false
                        onClicked: {
                            run_status.text = "当前任务:区域监测"
                        }
                    }
                    ICButton{
                        id: search_fire
                        text: "巡逻检测"
                        height: 35
                        width: s_screenSafer.width
                        onClicked: {
                            run_status.text = "当前任务:巡逻检测"
                            Control.sendData(Control.AUTO_CHECK,1);
                        }
                    }
                    ICButton{
                        id: stopRun
                        text: "停止运行"
                        height: 35
                        width: s_screenSafer.width
                        onClicked: {
                            nowTask.text = run_status.text
                            run_status.text = "当前任务:停止运行"
                            Control.sendData(Control.C_STOP,1);
                        }
                    }
                    ICButton{
                        id: skipRun
                        text: "继续运行"
                        height: 35
                        visible: false
                        width: s_screenSafer.width
                        onClicked: {
                            run_status.text = nowTask.text
                            Control.sendData(Control.AUTO_CHECK,1);
                        }
                    }
                    Text {
                        id: nowTask
                        visible: false
                        text: "当前任务:待机"
                    }
                }
            }
            Rectangle{
                id:showMessagebox
//                border.color: "black"
                width: 543
                height: 200
                Row{
                    Grid{
                        rows: 2
                        columns: 2
                        spacing: 0
                        Motor{
                            id: e_machine0
                            title: "左前电机"
                            xValue: "0"
                        }
                        Motor{
                            id: e_machine1
                            title: "右前电机"
                            xValue: "1"
                        }
                        Motor{
                            id: e_machine2
                            title: "左后电机"
                            xValue: "2"
                        }
                        Motor{
                            id: e_machine3
                            title: "右后电机"
                            xValue: "3"
                        }
                    }
                    Column{
                        id: observe
                        spacing: -40
                        FireCheck{
                            id:fire_ck
                        }
                        SerialObserve{
                            id:com_text
                            visible: false
                        }
                    }
                }
            }
            Rectangle{
                id:showControl
                visible: false
//                border.color: "black"
                width: 195
                height: 195
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                ICButtonGroup{
                    id: controlRun
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
    ICSerialConfig{
        id:serialLoader
        visible: false
    }
    ICConfigSetWindow{
        id:ss_setWindow
        visible: false
        onVisibleChanged: {
            if(!visible){
                if(Number(ss_time.text) == 0)
                    screenSafeRun.stop();
                else
                    screenSafeRun.start();
            }
        }
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import "./ControlQml"
import "./control.js" as Control

ApplicationWindow {
    id: mainRec
    visible: true
    width: 760
    height: 615
    title: qsTr("Name--")
    onVisibleChanged: {
        screenTime5.start();
        longerStatus.progress25 = true;
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
                 screenSafeRun.start();
             }
        }
        Timer{
             id: screenSafeRun
             repeat: false;
             interval: (60000*Number(ss_time.text));
             onTriggered: {
                 mainWindow.visible = false;
                 screenSafer.visible = true;
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
                        text: "COM14"
                    }
                    Text {
                        id: whichBaudRate
                        text: "115200"
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
            spacing: 50
            Row{
                Image {
                    id: run_mg1
                    source: "file"
                }
                Text {
                    id: run_status
                    font.pixelSize: 20
                    text: "当前任务:待机"
                }
            }
            Row{
                Image {
                    id: run_mg4
                    source: "file"
                }
                Text {
                    id: can_status
                    font.pixelSize: 20
                    text: "通信状态:良好"
                }
            }
            Row{
                Image {
                    id: run_mg2
                    source: "file"
                }
                Text {
                    id: fireDone_status
                    font.pixelSize: 20
                    text: "灭火器状态:良好"
                }
            }
            Row{
                Image {
                    id: run_mg3
                    source: "file"
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
                        ss_time.text = 2;
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
                        onClicked: {
                            run_status.text = "当前任务:手动灭火"
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
                        }
                    }
                    ICButton{
                        id: skipRun
                        text: "继续运行"
                        height: 35
                        width: s_screenSafer.width
                        onClicked: {
                            run_status.text = nowTask.text
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
                anchors.bottomMargin: -20
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
}

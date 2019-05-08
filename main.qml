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
    title: qsTr("串口调试助手--")
    onVisibleChanged: {
        screenTime1.start();
        longerStatus.progress25 = true;
    }
    Rectangle{
        id: screenStart
        anchors.centerIn: parent
        Image {
            id: screenShop
            source: "./image/panda.png"
            anchors.centerIn: parent
        }
//        Image {
//            id: longerStatus
//            source: "./image/panda.png"
//            anchors.left: parent.left
//            anchors.leftMargin: -125
//            anchors.bottom: parent.bottom
//            anchors.bottomMargin: -300
//        }
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
             }
        }
    }
    Column{
        id: mainWindow
        spacing: 10
        visible: false
        Row{
            x:10
            y:10
            spacing : 10
            Column{
                spacing: 3
                width: 200
                Text {
                    font.pixelSize: 20
                    width: 160
                    height: 35
                    text: qsTr("        串口设置")
                }
                ICButton{
                    id: serialSet
                    width: 160
                    height: 35
                    text: qsTr("端口号:COM14")
                    onClicked: {
                        comMenu.popup();
                    }
                }
                Text{
                    id: comtext
                    visible: false
                    text: "13"
                }
                Menu{
                     id : comMenu
                     title: "&File"
                     MenuItem {
                         text: "COM1"
                         onTriggered:{
                             comtext.text = "0";
                             serialSet.text = "端口号:COM1";
                         }
                     }
                     MenuItem {
                         text: "COM2"
                         onTriggered:{
                             comtext.text = "1";
                             serialSet.text = "端口号:COM2";
                         }
                     }
                     MenuItem {
                         text: "COM3"
                         onTriggered:{
                             comtext.text = "2";
                             serialSet.text = "端口号:COM3";
                         }
                     }
                     MenuItem {
                         text: "COM4"
                         onTriggered:{
                             comtext.text = "3";
                             serialSet.text = "端口号:COM4";
                         }
                     }
                     MenuItem {
                         text: "COM5"
                         onTriggered:{
                             comtext.text = "4";
                             serialSet.text = "端口号:COM5";
                         }
                     }
                     MenuItem {
                         text: "COM6"
                         onTriggered:{
                             comtext.text = "5";
                             serialSet.text = "端口号:COM6";
                         }
                     }
                     MenuItem {
                         text: "COM7"
                         onTriggered:{
                             comtext.text = "6";
                             serialSet.text = "端口号:COM7";
                         }
                     }
                     MenuItem {
                         text: "COM8"
                         onTriggered:{
                             comtext.text = "7";
                             serialSet.text = "端口号:COM8";
                         }
                     }
                     MenuItem {
                         text: "COM9"
                         onTriggered:{
                             comtext.text = "8";
                             serialSet.text = "端口号:COM9";
                         }
                     }
                     MenuItem {
                         text: "COM10"
                         onTriggered:{
                             comtext.text = "9";
                             serialSet.text = "端口号:COM10";
                         }
                     }
                     MenuItem {
                         text: "COM11"
                         onTriggered:{
                             comtext.text = "10";
                             serialSet.text = "端口号:COM11";
                         }
                     }
                     MenuItem {
                         text: "COM12"
                         onTriggered:{
                             comtext.text = "11";
                             serialSet.text = "端口号:COM12";
                         }
                     }
                     MenuItem {
                         text: "COM13"
                         onTriggered:{
                             comtext.text = "12";
                             serialSet.text = "端口号:COM13";
                         }
                     }
                     MenuItem {
                         text: "COM14"
                         onTriggered:{
                             comtext.text = "13";
                             serialSet.text = "端口号:COM14";
                         }
                     }
                     MenuItem {
                         text: "COM15"
                         onTriggered:{
                             comtext.text = "14";
                             serialSet.text = "端口号:COM15";
                         }
                     }
                 }

                ICButton{
                    id: baudRateSet
                    width: serialSet.width
                    height: serialSet.height
                    text: qsTr("波特率:115200")
                    onClicked: {
                        baudRate.popup();
                    }
                }
                Text{
                    id: baudRatetext
                    visible: false
                    text: "3"
                }
                Menu{
                     id : baudRate
                     title: "&File"
                     MenuItem {
                         text: "9600"
                         onTriggered:{
                             baudRatetext.text = "0";
                             baudRateSet.text = "波特率:9600"
                         }
                     }
                     MenuItem {
                         text: "19200"
                         onTriggered:{
                             baudRatetext.text = "1";
                             baudRateSet.text = "波特率:19200"
                         }
                     }
                     MenuItem {
                         text: "38400"
                         onTriggered:{
                             baudRatetext.text = "2";
                             baudRateSet.text = "波特率:38400"
                         }
                     }
                     MenuItem {
                         text: "115200"
                         onTriggered:{
                             baudRatetext.text = "3";
                             baudRateSet.text = "波特率:115200"
                         }
                     }
                }

                ICButton{
                    id: dataBitsSet
                    width: serialSet.width
                    height: serialSet.height
                    text: qsTr("数据位:8")
                    onClicked: {
                        dataBits.popup();
                    }
                }
                Text{
                    id: dataBitstext
                    visible: false
                    text: "3"
                }
                Menu{
                     id : dataBits
                     title: "&File"
                     MenuItem {
                         text: "5"
                         onTriggered:{
                             dataBitstext.text = "0";
                             dataBitsSet.text = "数据位:5"
                         }
                     }
                     MenuItem {
                         text: "6"
                         onTriggered:{
                             dataBitstext.text = "1";
                             dataBitsSet.text = "数据位:6"
                         }
                     }
                     MenuItem {
                         text: "7"
                         onTriggered:{
                             dataBitstext.text = "2";
                             dataBitsSet.text = "数据位:7"
                         }
                     }
                     MenuItem {
                         text: "8"
                         onTriggered:{
                             dataBitstext.text = "3";
                             dataBitsSet.text = "数据位:8"
                         }
                     }
                }

                ICButton{
                    id: checkDigitSet
                    width: serialSet.width
                    height: serialSet.height
                    text: qsTr("校验位:2")
                    onClicked: {
                        checkDigit.popup();
                    }
                }
                Text{
                    id: checkDigittext
                    visible: false
                    text: "3"
                }
                Menu{
                     id : checkDigit
                     title: "&File"
                     MenuItem {
                         text: "无"
                         onTriggered:{
                             checkDigittext.text = "0";
                             checkDigitSet.text = "校验位:无";
                         }
                     }
                     MenuItem {
                         text: "1"
                         onTriggered:{
                             checkDigittext.text = "1";
                             checkDigitSet.text = "校验位:1";
                         }
                     }
                     MenuItem {
                         text: "2"
                         onTriggered:{
                             checkDigittext.text = "2";
                             checkDigitSet.text = "校验位:2";
                         }
                     }
                }

                ICButton{
                    id: stopBitsSet
                    width: serialSet.width
                    height: serialSet.height
                    text: qsTr("停止位:2")
                    onClicked: {
                        stopBits.popup();
                    }
                }
                Text{
                    id: stopBitstext
                    visible: false
                    text: "3"
                }
                Menu{
                     id : stopBits
                     title: "&File"
                     MenuItem {
                         text: "1"
                         onTriggered:{
                             stopBitstext.text = "0";
                             stopBitsSet.text = "停止位:1"
                         }
                     }
                     MenuItem {
                         text: "1.5"
                         onTriggered:{
                             stopBitstext.text = "1";
                             stopBitsSet.text = "停止位:1.5"
                         }
                     }
                     MenuItem {
                         text: "2"
                         onTriggered:{
                             stopBitstext.text = "2";
                             stopBitsSet.text = "停止位:2"
                         }
                     }
                }

                ICButton{
                    id: flowControlSet
                    width: serialSet.width
                    height: serialSet.height
                    text: qsTr("流控制:软件")
                    onClicked: {
                        flowControl.popup();
                    }
                }
                Text{
                    id: flowControltext
                    visible: false
                    text: "3"
                }
                Menu{
                     id : flowControl
                     title: "&File"
                     MenuItem {
                         text: "无"
                         onTriggered:{
                             flowControltext.text = "0";
                             flowControlSet.text = "停止位:无"
                         }
                     }
                     MenuItem {
                         text: "硬件"
                         onTriggered:{
                             flowControltext.text = "1";
                             flowControlSet.text = "停止位:硬件"
                         }
                     }
                     MenuItem {
                         text: "软件"
                         onTriggered:{
                             flowControltext.text = "2";
                             flowControlSet.text = "停止位:软件"
                         }
                     }
                }

                RunState{
                    id:run
                    width: serialSet.width
                    height: serialSet.height
                    comnfigName: "状态"
                    state: false
                    btOKName: "打开串口"
                    btCancelName: "关闭串口"
                    onBtClick: {
                        if(!state){
                            var ret = serialtest.openAndSetPort(Number(comtext.text),
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
//            Column{
//                OverSee{
//                    id:oversee
//                }
//            }
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
                spacing: 15
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
                Column{
                    id: manualMode
                    visible: true
                    spacing: 5
                    ICButton{
                        id: m_fireDone
                        text: "手动灭火"
                        height: 35
                        width: 140
                        onClicked: {
                            run_status.text = "当前任务:手动灭火"
                        }
                    }
                    ICButton{
                        id: c_manualMove
                        visible: true
                        text: "开启手动导航"
                        height: 35
                        width: 140
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
                        text: "关闭手动导航"
                        height: 35
                        width: 140
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
                        width: 140
                        onClicked: {
                            run_status.text = "当前任务:区域监测"
                        }
                    }
                    ICButton{
                        id: search_fire
                        text: "巡逻检测"
                        height: 35
                        width: 140
                        onClicked: {
                            run_status.text = "当前任务:巡逻检测"
                        }
                    }
                    ICButton{
                        id: stopRun
                        text: "停止运行"
                        height: 35
                        width: 140
                        onClicked: {
                            nowTask.text = run_status.text
                            run_status.text = "当前任务:停止运行"
                        }
                    }
                    ICButton{
                        id: skipRun
                        text: "继续运行"
                        height: 35
                        width: 140
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
                    Mpu6050{
                        id: observe
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
}

import QtQuick 2.0

Rectangle {
    id:root
    property bool state: true
    property alias comnfigName: text.text
    property string btOKName: ""
    property string btCancelName: ""
    width: runLed.width + text.width
    height: 35

    signal btClick()

    Rectangle{
        id:runLed
        radius: 15
        width: 15
        height: 15
        y:2
        color: state?"red":"green"
    }
    Text {
        id: text
        anchors.left: runLed.right
        text: qsTr("text")
        font.pointSize: 15
    }
    ICButton{
        id:enter
        text:btOKName
        width: 145
        height: 35
        anchors.left: text.right
        onClicked: {
            btClick()
        }
    }
    onStateChanged: {
        if(state){
            runLed.color = "green"
            enter.text = btCancelName
        }
        else if(!state){
            runLed.color = "red"
             enter.text = btOKName
        }
    }

}

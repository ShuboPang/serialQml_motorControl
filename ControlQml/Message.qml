import QtQuick 2.0
import QtQuick.Controls 2.2
import "./"

Rectangle {
    id:root
    property alias title: title.text
    property alias message: text.text
    width: 160
    height: width / 16 * 9
    border.color: "black"
    border.width: 1
    Text {
        id: title
        text: qsTr("Error")
        anchors.left: parent.left
        anchors.top:parent.top
        anchors.leftMargin: 2
        anchors.topMargin: 2
    }
    Rectangle{
        id:line
        width: parent.width
        anchors.top:title.bottom
        anchors.left:title.left
        height: 1
        border.color: "black"
    }
    Text {
        id: text
        text: qsTr("text")
        anchors.centerIn: parent
        anchors.bottomMargin: 5
    }
    ICButton{
        text: "OK"
        anchors.bottom: root.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 5
        onClicked: {
            root.visible = false
        }
    }
}

import QtQuick 2.0

Rectangle{
    id:root
    property alias configName: title.text
    property alias configValue: value.text
    property alias unit:unit.text
    width: title.width + value.width+unit.width
    radius: 5
    height: 25
    Text {
        id: title
        text: qsTr("name:")
        font.pointSize: 15
    }
    Text {
        id: value
        anchors.left:title.right
        text: "0"
        font.pointSize: 15
    }
    Text {
        id: unit
        anchors.left:value.right
        text: qsTr("")
        font.pointSize: 15
    }

}

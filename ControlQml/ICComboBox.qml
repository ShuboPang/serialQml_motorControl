import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    property alias configName: text.text
    property alias item: box.model
    property alias connfigValue: box.currentIndex
    property alias configValueText: box.currentText
    property alias textColor: text.color
    property alias inputWidth: box.width
    width: text.width + box.width
    height: 25
    Text {
        id: text
        text: qsTr("name")
        font.pointSize: 15
    }
    ComboBox{
        id:box
        anchors.left:text.right
        font.pointSize: 12
        width: 100
        height: 25
    }
}

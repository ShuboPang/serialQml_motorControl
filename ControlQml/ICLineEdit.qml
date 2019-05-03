import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle{
    id:root
    property alias configValue:text.text
    property alias inputWidth: text.width
    width: text.width + 2
    height: 25
    border.color: "black"
    border.width: 1
    TextInput{
        id:text
        width: 50
        height: 25
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.top:parent.top
        anchors.topMargin: 2
        selectByMouse: true
        mouseSelectionMode: TextInput.SelectCharacters
        selectedTextColor: "blue"
        font.pointSize: 15
    }

}

import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id:root
    width: text.width+edit.width
    height: 25
    property alias configName: text.text
    property alias configValue: edit.configValue
    property alias inputWidth: edit.inputWidth

    Text {
        id:text
        text: ""
        font.pointSize: 15
    }
    ICLineEdit{
        id:edit
        anchors.left :text.right
        inputWidth: 117
        height: 25
        configValue: ""
        enabled: root.enabled
    }
}

import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id:root
    width: checkBox.width
    height: 25
    property alias configName: checkBox.text
    property alias configValue: checkBox.checkState

    CheckBox{
        id:checkBox
        text:""
        font.pointSize: 15
        enabled: root.enabled
    }
}

import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import "./ControlQml"

Rectangle {
    id:root
    property alias xValue: x.configValue
    property alias yValue: y.configValue
    width: borderLine.width + 20
    height: borderLine.width - 25
    Rectangle{
        id:titleRec
        z:2
        opacity:1
        width:title.width+10
        height: title.height+5
        Text {
            id: title
            x:5
            z:3
            text: qsTr("实时检测")
            font.pointSize: 15
        }
    }

    Rectangle{
        id:borderLine
        border.color: "black"
        radius: 5
        border.width: 2
        anchors.top: titleRec.top
        anchors.left: titleRec.left
        anchors.topMargin: 13
        anchors.leftMargin : -5
        height: (x.height + 15) * 2.3
        width: 190
        z:1
        Column{
            id:showxyz
            spacing: 5
            x:10
            y:20
            Row{
                ICSurveillance{
                    id:x
                    configName: "火焰检测:"
                    configValue: "未检测到"
                    unit:""
                }
            }
            Row{
                ICSurveillance{
                    id:y
                    configName: "开始灭火:"
                    configValue: "否"
                    unit:""
                }
            }
        }
    }
}

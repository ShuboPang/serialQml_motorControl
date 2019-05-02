import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
import "./ControlQml"

Rectangle {
    id:root
    property alias title: title.text
    property alias xValue: x.configValue
    property alias yValue: y.configValue
    property alias zValue: z.configValue
    width: borderLine.width +20
    height: borderLine.width +20
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
            text: ""
            font.pointSize: 15
        }
    }

    Rectangle{
        id:borderLine
        border.color: "black"
        border.width: 1
        anchors.top: titleRec.top
        anchors.left: titleRec.left
        anchors.topMargin: 7
        anchors.leftMargin : -5
        height: (x.height + 15) * 3
        width: 150
        z:1
        Column{
            id:showxyz
            spacing: 5
            x:10
            y:20
            Row{
                ICSurveillance{
                    id:x
                    configName: "当前脉冲:"
                    configValue: "0"
                    unit:""
                }
            }
            Row{
                ICSurveillance{
                    id:y
                    configName: "目标脉冲:"
                    configValue: "0"
                    unit:""
                }
            }
            Row{
                ICSurveillance{
                    id:z
                    configName: "速度:"
                    configValue: "0"
                    unit:""
                }
            }
        }
    }
}

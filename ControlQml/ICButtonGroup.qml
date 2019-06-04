import QtQuick 2.0
import QtQuick.Controls 2.2
import "../ControlQml"
import "../control.js" as Control

Rectangle {
    Column{
        Row{
            anchors.left: parent.left
            anchors.leftMargin: 65
            Button{
                id:goUp
                text: "▲"
                width: 65
                height: width
                font.pointSize: 20
                onClicked: {
                    Control.sendData(Control.GO_UP,1);
                }
            }
        }
        Row{
            Button{
                id:goLeft
                text: "◀"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
                onClicked: {
                    Control.sendData(Control.GO_LEFT,1);
                }
            }
            Button{
                id:stayHere
                text: "●"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
                onClicked: {
                    Control.sendData(Control.C_STOP,1);
                }
            }
            Button{
                id:goRight
                text: "▶"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
                onClicked: {
                    Control.sendData(Control.GO_RIGHT,1);
                }
            }
        }
        Row{
            anchors.left: parent.left
            anchors.leftMargin: 65
            Button{
                id:goDown
                text: "▼"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
                onClicked: {
                    Control.sendData(Control.GO_DOWN,1);
                }
            }
        }
    }
}

import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    Column{
        Row{
            anchors.left: parent.left
            anchors.leftMargin: 65
            Button{
                id:goUp
                text: "↑"
                width: 65
                height: width
                font.pointSize: 20
            }
        }
        Row{
            Button{
                id:goLeft
                text: "←"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
            }
            Button{
                id:stayHere
                text: "●"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
            }
            Button{
                id:goRight
                text: "→"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
            }
        }
        Row{
            anchors.left: parent.left
            anchors.leftMargin: 65
            Button{
                id:goDown
                text: "↓"
                width: goUp.width
                height: goUp.height
                font.pointSize: 20
            }
        }
    }
}

import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle{
    property alias progress25: fix25.visible
    property alias progress50: fix50.visible
    property alias progress75: fix75.visible
    property alias progress100: fix100.visible
    width: 20
    height: 300
    border.color: "black"
    rotation:90
    radius: 10
    Rectangle{
        id: fix25
        visible: false
        anchors.top: parent.top
        anchors.topMargin: 225
        width: 20
        height: 75
        border.color: "red"
//        rotation:90
        radius: 10
        gradient: Gradient {
            GradientStop{
                position: 0.0;
                color: "red";
            }
            GradientStop{
                position: 1.0;
                color: "blue";
            }
        }
    }
    Rectangle{
        id: fix50
        visible: false
        anchors.top: parent.top
        anchors.topMargin: 150
        width: 20
        height: 150
        border.color: "red"
//        rotation:90
        radius: 10
        gradient: Gradient {
            GradientStop{
                position: 0.0;
                color: "red";
            }
            GradientStop{
                position: 1.0;
                color: "blue";
            }
        }
    }
    Rectangle{
        id: fix75
        visible: false
        anchors.top: parent.top
        anchors.topMargin: 75
        width: 20
        height: 225
        border.color: "red"
//        rotation:90
        radius: 10
        gradient: Gradient {
            GradientStop{
                position: 0.0;
                color: "red";
            }
            GradientStop{
                position: 1.0;
                color: "blue";
            }
        }
    }
    Rectangle{
        id: fix100
        visible: false
        width: 20
        height: 300
        border.color: "red"
//        rotation:90
        radius: 10
        gradient: Gradient {
            GradientStop{
                position: 0.0;
                color: "red";
            }
            GradientStop{
                position: 1.0;
                color: "blue";
            }
        }
    }
}

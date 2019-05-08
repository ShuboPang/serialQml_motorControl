import QtQuick 2.0

Rectangle
{
    id:root
    anchors.centerIn: parent
    width: 200
    height: 200
    color: "transparent"
    property int time_H : 0;
    property int time_M : 0;
    property int time_S : 0;


    Timer
    {
            interval: 500; running: true; repeat: true
            onTriggered:
            {

                time.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
                root.time_H = Qt.formatDateTime(new Date(), "hh")
                root.time_M = Qt.formatDateTime(new Date(), "mm")
                root.time_S = Qt.formatDateTime(new Date(), "ss")
            }

    }

    Canvas
    {
        anchors.fill: parent
        onPaint:
        {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.strokeStyle = "#000000";
            ctx.globalAlpha = 1.0;
            ctx.beginPath();
            ctx.arc(100,100,99,0,2*Math.PI);
            ctx.stroke();
            ctx.restore();

            for(var i =0;i<32;i++)
            {
                ctx.save();
                ctx.translate(width/2,height/2);
                ctx.rotate(((i)*30)*Math.PI/180);
                ctx.beginPath();
                //判定长短线
                if(i%3 == 0)
                {
                    ctx.moveTo(0,-99+15);
                    ctx.lineTo(0,-99+2);
                }
                else
                {
                    ctx.moveTo(0,-99+10);
                    ctx.lineTo(0,-99+2);
                }
                //绘制
                ctx.stroke();
                ctx.restore();
            }
        }
    }
    Rectangle
    {
        width: 20
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 15
        color: "#00000000"
        Text {
            anchors.centerIn: parent
            font.family: "微软雅黑"
            font.pixelSize: 14
            color: "#000000"
            text: qsTr("12")
        }
    }
    Rectangle
    {
        width: 20
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        color: "#00000000"
        Text {
            anchors.centerIn: parent
            font.family: "微软雅黑"
            font.pixelSize: 14
            color: "#000000"
            text: qsTr("3")
        }
    }
    Rectangle
    {
        width: 20
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 15
        color: "#00000000"
        Text {
            anchors.centerIn: parent
            font.family: "微软雅黑"
            font.pixelSize: 14
            color: "#000000"
            text: qsTr("9")
        }
    }
    Rectangle
    {
        width: 20
        height: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        color: "#00000000"
        Text {
            anchors.centerIn: parent
            font.family: "微软雅黑"
            font.pixelSize: 14
            color: "#FFFFFF"
            text: qsTr("6")
        }
    }
    Canvas
    {
        id:m_Hour
        property int m_Radius: (root.width>=root.height)? (root.height)/2 : (root.width)/2
        width: m_Radius*2
        height: m_Radius*2
        anchors.centerIn: parent
        rotation: (root.time_H%12)*30 + root.time_M*6/60 + root.time_S*6/60/60 - 180
        onPaint:
        {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.fillStyle = "#000000";
            ctx.strokeStyle = "#000000";
            ctx.beginPath()
            ctx.moveTo(m_Radius,m_Radius)
            ctx.lineTo(m_Radius+4,m_Radius+m_Radius*0.5)
            ctx.lineTo(m_Radius,m_Radius*2-37)
            ctx.lineTo(m_Radius-4,m_Radius+m_Radius*0.5)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }

    }
    Canvas
    {
        id:m_Min
        property int m_Radius: (root.width>=root.height)? (root.height)/2 : (root.width)/2
        width: m_Radius*2
        height: m_Radius*2
        anchors.centerIn: parent
        rotation: root.time_M*6 + root.time_S*6/60 - 180
        onPaint:
        {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.fillStyle = "yellow";
            ctx.strokeStyle = "yellow";
            ctx.beginPath()
            ctx.moveTo(m_Radius,m_Radius)
            ctx.lineTo(m_Radius+2,m_Radius+m_Radius*0.5)
            ctx.lineTo(m_Radius,m_Radius*2-32)
            ctx.lineTo(m_Radius-2,m_Radius+m_Radius*0.5)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }

    }

    Canvas
    {
        id:m_Second
        property int m_Radius: (root.width>=root.height)? (root.height)/2 : (root.width)/2
        width: m_Radius*2
        height: m_Radius*2
        anchors.centerIn: parent
        rotation: root.time_S*6 - 180
        onPaint:
        {
            var ctx = getContext("2d");
            ctx.lineWidth = 2;
            ctx.fillStyle = "red";
            ctx.strokeStyle = "red";
            ctx.beginPath()
            ctx.moveTo(m_Radius,m_Radius)
            ctx.lineTo(m_Radius+1,m_Radius+m_Radius*0.5)
            ctx.lineTo(m_Radius,m_Radius*2-28)
            ctx.lineTo(m_Radius-1,m_Radius+m_Radius*0.5)
            ctx.closePath()
            ctx.fill()
            ctx.stroke()
        }

    }
    Rectangle
    {
        border.color: "#000000"
        border.width: 2
        width: 80
        height: 40
        anchors.centerIn: parent
        color: "#000000"
        Text {
            id:time
            anchors.centerIn: parent
            color: "#00FF00"
            font.family: "微软雅黑"
            font.pixelSize: 16
            text: qsTr("22:22:22")
        }
    }

}

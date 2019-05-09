import QtQuick 2.0

FocusScope{
    property alias label: label.text           //定义属性别名
    property alias text: input.text
    property alias inputWidth: inputs.width
    property alias inputHeight: inputs.height
    property alias bgcolor: inputs.color

    Row{
        spacing: 5

        Text{
            id: label
            text: "标签"
            font.pixelSize: 22
        }

        Rectangle{
            id: inputs
            width: 100
            height: 35
            color: "white"                      //白底色
            border.color: "gray"                //灰色边框
            TextInput{
                id: input
                anchors.fill: parent
                anchors.margins: 4
                focus: true
                text: "请输入内容"
                font.pixelSize: 22
            }
        }
    }
}

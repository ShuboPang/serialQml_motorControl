import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    id:root
    property alias configName: name.text
    property alias configValue: edit.text
    property alias nameWidth: left.width
    property alias inputText: edit.text
    property alias inputWidth: edit.width
    property alias inputHeight: edit.height
    property bool isSend: false
    property alias inputCount: recvCount.text
    width: left.width+showRec.width
    height: edit.height

    signal clickClear()
    signal sendData()

    Row{

        Rectangle{
            id:showRec
            border.color: "black"
            border.width: 2
            radius: 5
            x:5
            width: edit.width + 5
            height: edit.height + 5
            Flickable {
                id: flick
                width: edit.width
                height:  edit.height
                contentWidth: edit.paintedWidth
                contentHeight: edit.paintedHeight
                //拖动
                interactive: false
                clip: true

                function ensureVisible(r) {
                    if(contentX >= r.x)
                        contentX = r.x;
                    else if(contentX + width <= r.x + r.width)
                        contentX = r.x + r.width -width
                    if(contentY >= r.y)
                        contentY = r.y
                    else if(contentY + height <= r.y + r.height)
                        contentY = r.y + r.height - height
                }

                TextEdit {
                      id: edit
                      text: ""
                      font.pointSize: 15
                      height: 50
                      width: 100
                      anchors.left:parent.left
                      anchors.leftMargin: 3
                      anchors.top:parent.top
                      anchors.topMargin: 3
                      wrapMode: TextEdit.Wrap
                      readOnly: !isSend
                      selectByMouse: true
                      mouseSelectionMode: TextInput.SelectCharacters
                      selectedTextColor: "blue"
                      onTextChanged: {
                        if(text.length >=10000)
                            clickClear()
                      }
                  }
              }
              MouseArea{
                  anchors.fill: parent
                  onClicked: {
                      edit.forceActiveFocus();
                  }
              }
        }
        Column{
            id:left
            spacing: 10
            Text {
                id: name
                text: qsTr("name:")
                font.pointSize: 15
    //            anchors.verticalCenter: showRec
            }
            ICButton{
                id:clear
                text: "清空"
                height: 35
                onClicked: {
                    clickClear()
                }
            }
            Row{
                spacing: 2
                visible: !isSend
                Text {
                    text: qsTr("接收数:")
                    font.pointSize: 12
                }
                Text {
                    id: recvCount
                    font.pointSize: 12
                    text:"0"
                    onTextChanged: {
                        if(Number(text) >= 20000)
                        {
                            clickClear()
                        }
                    }
                }
            }

            ICButton{
                id:send
                text: "发送"
                height: 35
                visible: isSend
                onClicked: {
                    sendData()
                }
            }

        }

    }
}

import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Particles 2.0
import QtQuick.Controls 2.2


Window {
    width: 240
    height: 300
    title: "串口配置"
    Column{
        id:setPort
        spacing: 5
        x:10
        y:20
        ICComboBox{
            id:port
            configName:"端口号:"
            inputWidth: 130
            item: ["COM1","COM2","COM3","COM4","COM5","COM6","COM7","COM8","COM9","COM10","COM11","COM12","COM13","COM14","COM15"]
            configValue: 13
            onConfigValueChanged:{
                portText.text = configValue;
                whichCom.text = configValueText;
            }
        }
        ICComboBox{
            id:baudRate
            configName:"波特率:"
            inputWidth: port.inputWidth
            item: ["9600","19200","38400","115200"]
            configValue: 3
            onConfigValueChanged:{
                baudRatetext.text = configValue;
                whichBaudRate.text = configValueText;
            }
        }
        ICComboBox{
            id:dataBits
            configName:"数据位:"
            inputWidth: port.inputWidth
            item: ["5","6","7","8"]
            configValue: 3
            onConfigValueChanged:{
                dataBitstext.text = configValue;
            }
        }
        ICComboBox{
            id:checkDigit
            configName:"校验位:"
            inputWidth: port.inputWidth
            item: ["无","1","2"]
            onConfigValueChanged:{
                checkDigittext.text = configValue;
            }
        }
        ICComboBox{
            id:stopBits
            configName:"停止位:"
            inputWidth: port.inputWidth
            item: ["1","1.5","2"]
            onConfigValueChanged:{
                stopBitstext.text = configValue;
            }
        }
        ICComboBox{
            id:flowControl
            configName:"流控制:"
            inputWidth: port.inputWidth
            item: ["无","硬件","软件"]
            onConfigValueChanged:{
                flowControltext.text = configValue;
            }
        }
    }
}

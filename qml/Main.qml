import QtQuick
import QtQuick.Controls.Basic

// Custom:
import FileIO

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    FileIO {
        id: fileIO
    }

    Rectangle {
        anchors.fill: parent
        color: AppTheme.getColor(AppTheme.Colors.SwitchCircle)

        // UFOSwitch {
        //     id: switchCustom

        //     anchors.centerIn: parent
        //     width: 120
        //     height: 40
        //     checked: AppSettings.currentTheme === AppTheme.Themes.Dark ? true : false

        //     onCheckedChanged: {

        //         switchCustom.checked ? AppTheme.setTheme(AppTheme.Themes.Dark) : AppTheme.setTheme(AppTheme.Themes.Light)
        //     }
        // }

        CodeBox {
            id: codeBox

            anchors.centerIn: parent
            width: 120
            height: 50
            languageName: "cpp"

            Component.onCompleted: {
                text = fileIO.readFile(":/resources/txt/sample.txt");
            }
        }
    }
}

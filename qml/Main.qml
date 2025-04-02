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
        color: AppTheme.getColor(AppTheme.Colors.WindowBackground)

        Column {
            anchors.centerIn: parent

            UFOSwitch {
                id: switchCustom

                width: 120
                height: 40
                checked: AppSettings.currentTheme === AppTheme.Themes.UFODark ? true : false

                onCheckedChanged: {

                    switchCustom.checked ? AppTheme.setTheme(AppTheme.Themes.UFODark) : AppTheme.setTheme(AppTheme.Themes.UFOLight)
                }
            }

            CodeBox {
                id: codeBox

                width: 120
                height: 50
                languageName: "cpp"

                Component.onCompleted: {
                    text = fileIO.readFile(":/resources/txt/sample.txt");
                }
            }
        }
    }
}

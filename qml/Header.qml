import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    implicitHeight: 200
    implicitWidth: 200

    signal menuCheckedChanged(bool isChecked)

    Rectangle {
        id: rectangleBackground

        anchors.fill: parent

        radius: 0
        color: AppTheme.getColor(AppTheme.Colors.HeaderBackground)

        RowLayout {
            anchors.fill: parent
            anchors.margins: 10

            Text {
                Layout.preferredHeight: 30

                text: qsTr("UFO CODER")
                elide: Text.ElideRight
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: Qt.application.font.pixelSize * 1.35
                font.bold: true
            }

            Item {
                Layout.fillWidth: true
            }

            Button {
                id: buttonTheme

                Layout.preferredHeight: 30

                checkable: true
                checked: buttonTheme.isInDarkMode()
                display: AbstractButton.IconOnly
                icon.source: buttonTheme.isInDarkMode() ? "qrc:/resources/icons/dark_mode.svg" : "qrc:/resources/icons/light_mode.svg"

                function isInDarkMode() {
                    return(AppSettings.currentTheme === AppTheme.Themes.UFODark);
                }

                onCheckedChanged: {
                    buttonTheme.checked ? AppTheme.setTheme(AppTheme.Themes.UFODark) : AppTheme.setTheme(AppTheme.Themes.UFOLight)
                }
            }

            Button {
                id: button

                Layout.preferredHeight: 30

                text: qsTr("Menu")
                checkable: true
                checked: false
                display: AbstractButton.IconOnly
                icon.source: "qrc:/resources/icons/menu.svg"

                onCheckedChanged: {
                    root.menuCheckedChanged(button.checked);
                }
            }
        }
    }
}

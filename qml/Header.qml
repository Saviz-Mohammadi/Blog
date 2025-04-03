import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    implicitHeight: 200
    implicitWidth: 200

    signal menuIsClicked()

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

            UFOSwitch {
                id: switchCustom

                Layout.preferredHeight: 30

                checked: AppSettings.currentTheme === AppTheme.Themes.UFODark ? true : false

                onCheckedChanged: {

                    switchCustom.checked ? AppTheme.setTheme(AppTheme.Themes.UFODark) : AppTheme.setTheme(AppTheme.Themes.UFOLight)
                }
            }

            Button {
                id: button

                Layout.preferredHeight: 30

                text: qsTr("Menu")

                onClicked: {
                    root.menuIsClicked();
                }
            }
        }
    }
}

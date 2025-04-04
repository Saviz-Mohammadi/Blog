import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    signal menuClicked()

    implicitHeight: 200
    implicitWidth: 200

    Rectangle {
        id: rectangleBackground

        anchors.fill: parent

        radius: 0
        color: AppTheme.getColor(AppTheme.Colors.HeaderBackground)

        RowLayout {
            anchors.fill: parent
            anchors.margins: 15

            Label {
                Layout.preferredHeight: 30

                text: qsTr("UFO CODER")
                color: AppTheme.getColor(AppTheme.Colors.HeaderLabelText)
                elide: Text.ElideRight
                font.family: AppFont.titilliumSemiBoldFont.family
                font.weight: AppFont.titilliumSemiBoldFont.weight
                font.styleName: AppFont.titilliumSemiBoldFont.styleName
                font.pixelSize: Qt.application.font.pixelSize * 2.00
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
            }

            Item {
                Layout.fillWidth: true
            }

            UFOButton {
                id: buttonTheme

                Layout.preferredWidth: 40
                Layout.preferredHeight: 30

                checkable: true
                checked: buttonTheme.isInDarkMode()
                radius: 50
                display: AbstractButton.IconOnly
                icon.source: buttonTheme.isInDarkMode() ? "qrc:/resources/icons/dark_mode.svg" : "qrc:/resources/icons/light_mode.svg"

                // TODO (SAVIZ): Probably a good idea to replace this with as switch statement so that in future if we have more themes we can be more flexible:
                function isInDarkMode() {
                    return(AppSettings.currentTheme === AppTheme.Themes.UFODark);
                }

                onCheckedChanged: {
                    buttonTheme.checked ? AppTheme.setTheme(AppTheme.Themes.UFODark) : AppTheme.setTheme(AppTheme.Themes.UFOLight)
                }
            }

            UFOButton {
                id: button

                Layout.preferredWidth: 40
                Layout.preferredHeight: 30

                text: qsTr("Menu")
                radius: 50
                display: AbstractButton.IconOnly
                icon.source: "qrc:/resources/icons/menu.svg"

                onClicked: {
                    root.menuClicked();
                }
            }
        }
    }
}

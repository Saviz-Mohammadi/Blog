import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 200
    implicitHeight: 200

    signal decrementRequested()
    signal incrementRequested()

    property int currentIndex: 0

    Rectangle {
        id: rectangleBackground

        anchors.fill: parent

        color: AppTheme.getColor(AppTheme.Colors.TutorialIndicatorBackground)

        RowLayout {
            anchors.fill: parent

            spacing: 10

            Item {
                Layout.fillWidth: true
            }

            UFOButton {
                Layout.preferredWidth: 65
                Layout.preferredHeight: 30

                display: AbstractButton.IconOnly
                icon.source: "qrc:/resources/icons/arrow_left_alt.svg"

                onClicked: {
                    root.decrementRequested();
                }
            }

            Text {
                Layout.fillHeight: true

                color: AppTheme.getColor(AppTheme.Colors.TutorialIndicatorText)
                text: root.currentIndex
                font.family: AppFont.titilliumRegularFont.family
                font.weight: AppFont.titilliumRegularFont.weight
                font.styleName: AppFont.titilliumRegularFont.styleName
                font.pixelSize: Qt.application.font.pixelSize * 1.25
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            UFOButton {
                Layout.preferredWidth: 65
                Layout.preferredHeight: 30

                display: AbstractButton.IconOnly
                icon.source: "qrc:/resources/icons/arrow_right_alt.svg"

                onClicked: {
                    root.incrementRequested();
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }
    }
}

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    signal pageSelected(int index)

    property int topMargin: 10
    property int bottomMargin: 10
    property int rightMargin: 10
    property int leftMargin: 10
    property int spacing: 0

    implicitWidth: 200
    implicitHeight: 200

    ScrollView {
        id: scrollView

        anchors.fill: parent

        contentWidth: -1
        contentHeight: columnLayout.implicitHeight + root.topMargin + root.bottomMargin
        ScrollBar.horizontal.policy: ScrollBar.AsNeeded
        ScrollBar.vertical.policy: ScrollBar.AsNeeded

        background: Rectangle {
            id: rectangleBackground

            radius: 0
            color: AppTheme.getColor(AppTheme.Colors.PageBackground)
        }

        ColumnLayout {
            id: columnLayout

            anchors.fill: parent
            anchors.topMargin: root.topMargin
            anchors.bottomMargin: root.bottomMargin
            anchors.rightMargin: root.rightMargin
            anchors.leftMargin: root.leftMargin

            clip: false
            spacing: root.spacing

            Text {
                elide: Text.ElideRight
                font.family: AppFont.titilliumSemiBoldFont.family
                font.weight: AppFont.titilliumSemiBoldFont.weight
                font.styleName: AppFont.titilliumSemiBoldFont.styleName
                font.pixelSize: Qt.application.font.pixelSize * 2.00
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2

                color: AppTheme.getColor(AppTheme.Colors.Line)
            }

            Text {
                elide: Text.ElideRight
                font.family: AppFont.titilliumSemiBoldFont.family
                font.weight: AppFont.titilliumSemiBoldFont.weight
                font.styleName: AppFont.titilliumSemiBoldFont.styleName
                font.pixelSize: Qt.application.font.pixelSize * 2.00
                wrapMode: Text.NoWrap
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignLeft
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 2

                color: AppTheme.getColor(AppTheme.Colors.Line)
            }

            Button {
                width: 120
                height: 100

                text: "Hello0"

                onClicked: {
                    root.pageSelected(0);
                }
            }

            Button {
                width: 120
                height: 100

                text: "Hello1"

                onClicked: {
                    root.pageSelected(1);
                }
            }
        }
    }
}

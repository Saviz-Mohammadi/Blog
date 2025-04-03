import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    property int topMargin: 15
    property int bottomMargin: 15
    property int rightMargin: 15
    property int leftMargin: 15
    property int spacing: 10

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

            // Text {
            //     id: text_PageTitle

            //     // anchors.top: parent.top
            //     // anchors.left: parent.left
            //     // anchors.right: parent.right

            //     // anchors.topMargin: root.contentTopMargin
            //     // anchors.leftMargin: root.contentLeftMargin
            //     // anchors.rightMargin: root.contentRightMargin

            //     //color: Qt.color(AppTheme.colors["UFO_Page_Title"])
            //     verticalAlignment: Text.AlignVCenter
            //     //font.pixelSize: Qt.application.font.pixelSize * titleFontSize
            //     elide: Text.ElideRight
            // }

            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }
            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }
            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }
            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }
            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }
            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }
            Rectangle { Layout.fillWidth: true; Layout.preferredHeight: 30; radius: 0; color: "blue" }

            UFOButton {
                Layout.fillWidth: true; Layout.preferredHeight: 30;
                text: qsTr("Test")
                icon.source: "qrc:/resources/icons/error.svg"
            }
        }
    }
}

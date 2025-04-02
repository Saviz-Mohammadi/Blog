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
        color: "red"

        RowLayout {
            anchors.fill: parent

            Button {
                id: button

                Layout.preferredWidth: 120
                Layout.preferredHeight: 30

                text: "Click Me"

                onClicked: {
                    root.menuIsClicked();
                }
            }
        }
    }
}

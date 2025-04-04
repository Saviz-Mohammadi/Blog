import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 200
    implicitHeight: 200

    SwipeView {
        id: view

        anchors.fill: parent

        currentIndex: 1

        CMakePart001 {
            id: firstPage
        }

        CMakePart002 {
            id: secondPage
        }
    }

    // TODO (SAVIZ): Something better might be to have a number as Text in the middle that shows the current page, and then have 2 buttons one that says next and one that says back to move between.
    PageIndicator {
        id: indicator

        count: view.count
        currentIndex: view.currentIndex

        anchors.bottom: view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

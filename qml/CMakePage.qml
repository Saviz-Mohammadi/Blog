import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 200
    implicitHeight: 200

    SwipeView {
        id: swipeView

        anchors.fill: parent

        currentIndex: 1

        Loader {
            id: loaderCMake001

            active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem

            sourceComponent: CMakePart001 {
                Component.onCompleted: console.log("created: Cmake part 1")
                Component.onDestruction: console.log("destroyed: CMake part 1")
            }

            onStatusChanged: {
                if (loaderCMake001.status == Loader.Ready) {
                    loaderCMake001.item.Layout.fillWidth = true;
                    loaderCMake001.item.Layout.fillHeight = true;
                }
            }
        }

        Loader {
            id: loaderCMake002

            active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem

            sourceComponent: CMakePart002 {
                Component.onCompleted: console.log("created: Cmake part 2")
                Component.onDestruction: console.log("destroyed: Cmake part 2")
            }

            onStatusChanged: {
                if (loaderCMake002.status == Loader.Ready) {
                    loaderCMake002.item.Layout.fillWidth = true;
                    loaderCMake002.item.Layout.fillHeight = true;
                }
            }
        }
    }

    // TODO (SAVIZ): Something better might be to have a number as Text in the middle that shows the current page, and then have 2 buttons one that says next and one that says back to move between.
    // PageIndicator {
    //     id: indicator

    //     count: view.count
    //     currentIndex: view.currentIndex

    //     anchors.bottom: view.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    // }

    RowLayout {
        spacing: 10
        anchors.bottom: parent.bottom  // adjust as needed

        Button {
            text: "Back"
            onClicked: swipeView.decrementCurrentIndex()
        }

        Button {
            text: "Forward"
            onClicked: swipeView.incrementCurrentIndex()
        }
    }
}

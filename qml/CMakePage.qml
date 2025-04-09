import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 200
    implicitHeight: 200

    SwipeView {
        id: swipeView

        anchors.top: root.top
        anchors.bottom: tutorialIndicator.top
        anchors.right: root.right
        anchors.left: root.left

        currentIndex: 0

        Loader {
            id: loaderCMake001

            active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem

            sourceComponent: CMakePart001 {}

            onStatusChanged: {
                if (loaderCMake001.status == Loader.Ready) {
                    loaderCMake001.item.Layout.fillWidth = true;
                    loaderCMake001.item.Layout.fillHeight = true;
                }
            }
        }

        // Loader {
        //     id: loaderCMake002

        //     active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem

        //     sourceComponent: CMakePart002 {}

        //     onStatusChanged: {
        //         if (loaderCMake002.status == Loader.Ready) {
        //             loaderCMake002.item.Layout.fillWidth = true;
        //             loaderCMake002.item.Layout.fillHeight = true;
        //         }
        //     }
        // }
    }

    TutorialIndicator {
        id: tutorialIndicator

        height: 45
        anchors.bottom: root.bottom
        anchors.right: root.right
        anchors.left: root.left

        currentIndex: swipeView.currentIndex

        onDecrementRequested: {
            swipeView.decrementCurrentIndex();
        }

        onIncrementRequested: {
            swipeView.incrementCurrentIndex();
        }
    }
}

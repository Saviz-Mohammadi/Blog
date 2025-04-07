import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Custom:
import FileIO

Window {
    id: rootWindow

    width: 640
    height: 480
    visible: true
    title: qsTr("UFO CODER")

    FileIO {
        id: mainFileIO
    }

    ColumnLayout {
        anchors.fill: parent

        spacing: 0

        Header {
            id: mainHeader

            Layout.fillWidth: true
            Layout.preferredHeight: 60
        }

        NavigationMenu {
            id: mainNavigationMenu

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: false

            Connections {
                target: mainHeader

                function onMenuClicked() {
                    mainNavigationMenu.visible = !mainNavigationMenu.visible;
                }
            }

            Connections {
                target: mainNavigationMenu

                function onPageRequested(index: int) {
                    mainNavigationMenu.visible = false;
                }
            }
        }

        // TODO (SAVIZ): I am not sure, but I need to check and see if 'StackLayout' actually is intelligent and reduces memory consumption of pages that are not visible, otherwies I will have to replace it with 'StackView'.
        StackLayout {
            id: mainStackLayout

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: true

            // Normal pages:
            HomePage {
                id: homePage

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            AboutPage {
                id: aboutPage

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            // Tutorial pages:
            CMakePage {
                id: cmakePage

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            GitPage {
                id: gitPage

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            function changePage(index: int) {
                switch (index) {
                case 0:
                    mainStackLayout.currentIndex = homePage.StackLayout.index;
                    break;
                case 1:
                    mainStackLayout.currentIndex = aboutPage.StackLayout.index;
                    break;
                case 2:
                    mainStackLayout.currentIndex = cmakePage.StackLayout.index;
                    break;
                case 3:
                    mainStackLayout.currentIndex = gitPage.StackLayout.index;
                    break;
                default:
                    break;
                }
            }

            Connections {
                target: mainHeader

                function onMenuClicked() {
                    mainStackLayout.visible = !mainStackLayout.visible;
                }
            }

            Connections {
                target: mainNavigationMenu

                function onPageRequested(index: int) {
                    mainStackLayout.changePage(index);
                    mainStackLayout.visible = true;
                }
            }

            Connections {
                target: homePage

                function onPageRequested(index : int) {
                    mainStackLayout.changePage(index);
                }
            }

            Component.onCompleted: {
                mainStackLayout.currentIndex = homePage.StackLayout.index
            }
        }
    }
}

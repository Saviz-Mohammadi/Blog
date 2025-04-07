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

            // Create a signal here and react in stackLayout and unhide it and switch to index and internally in navigationMenu hide it.
        }

        // NOTE (SAVIZ): I am not sure, but I need to check and see if 'StackLayout' actually is intelligent and reduces memory consumption of pages that are not visible, otherwies I will have to replace it with 'StackView'.
        StackLayout {
            id: stackLayout

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: true

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
                    stackLayout.currentIndex = homePage.StackLayout.index;
                    break;
                case 1:
                    stackLayout.currentIndex = aboutPage.StackLayout.index;
                    break;
                case 2:
                    stackLayout.currentIndex = cmakePage.StackLayout.index;
                    break;
                case 3:
                    stackLayout.currentIndex = gitPage.StackLayout.index;
                    break;
                default:
                    break;
                }
            }

            Connections {
                target: mainHeader

                function onMenuClicked() {
                    stackLayout.visible = !stackLayout.visible;
                }
            }

            Connections {
                target: mainNavigationMenu

                function onPageRequested(index: int) {
                    stackLayout.changePage(index);
                    stackLayout.visible = true;
                }
            }

            Connections {
                target: homePage

                function onPageRequested(index : int) {
                    stackLayout.changePage(index);
                }
            }

            Component.onCompleted: {
                stackLayout.currentIndex = homePage.StackLayout.index
            }
        }
    }

    // Rectangle {
    //     anchors.fill: parent
    //     color: AppTheme.getColor(AppTheme.Colors.WindowBackground)

    //     Column {
    //         anchors.centerIn: parent

    //         CodeBox {
    //             id: codeBox

    //             width: 120
    //             height: 50
    //             languageName: "cpp"

    //             Component.onCompleted: {
    //                 text = fileIO.readFile(":/resources/txt/sample.txt");
    //             }
    //         }
    //     }
    // }
}

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
    title: qsTr("Hello World")

    FileIO {
        id: universalFileIO
    }

    ColumnLayout {
        anchors.fill: parent

        spacing: 0

        Header {
            id: header

            Layout.fillWidth: true
            Layout.preferredHeight: 60
        }

        NavigationMenu {
            id: navigation

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: false

            Connections {
                target: header

                function onMenuClicked() {
                    navigation.visible = !navigation.visible;
                    stackLayout.visible = !stackLayout.visible;
                }
            }

            Connections {
                target: navigation

                function onPageSelected(index: int) {
                    navigation.visible = false;
                    stackLayout.changePage(index);
                    stackLayout.visible = true;
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

            CMakePage {
                id: cmakePage

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            function changePage(index: int) {
                switch (index) {
                case 0:
                    stackLayout.currentIndex = homePage.StackLayout.index;
                    break;
                case 1:
                    stackLayout.currentIndex = cmakePage.StackLayout.index;
                    break;
                default:
                    break;
                }
            }

            // Component.onCompleted: {
            //     stackLayout.currentIndex = ufo_Settings.StackLayout.index
            // }
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

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
            Layout.preferredHeight: 50

            onMenuIsClicked: {
                navigation.visible = !navigation.visible;
                stackLayout.visible = !stackLayout.visible;
            }
        }

        NavigationPage {
            id: navigation

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: false
        }

        // NOTE (SAVIZ): I am not sure, but I need to check and see if 'StackLayout' actually is intelligent and reduces memory consumption of pages that are not visible, otherwies I will have to replace it with 'StackView'.
        StackLayout {
            id: stackLayout

            enum PageName {
                Navigation,
                Home
            }

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: true

            CMakePage {
                id: homePage

                Layout.fillWidth: true
                Layout.fillHeight: true
            }

            function changePage(pageName) {

                switch (pageName) {
                case PageName.Navigation:
                    stackLayout.currentIndex = navigation.StackLayout.index;
                    break;
                case PageName.Home:
                    stackLayout.currentIndex = homePage.StackLayout.index;
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

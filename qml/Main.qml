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
            Layout.preferredHeight: 80

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

        StackLayout {
            id: stackLayout

            enum PageName {
                Navigation,
                Home
            }

            Layout.fillWidth: true
            Layout.fillHeight: true

            visible: true

            HomePage {
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

            Component.onCompleted: {
                stackLayout.currentIndex = ufo_Settings.StackLayout.index
            }
        }
    }

    // Rectangle {
    //     anchors.fill: parent
    //     color: AppTheme.getColor(AppTheme.Colors.WindowBackground)

    //     Column {
    //         anchors.centerIn: parent

    //         UFOSwitch {
    //             id: switchCustom

    //             width: 120
    //             height: 40
    //             checked: AppSettings.currentTheme === AppTheme.Themes.UFODark ? true : false

    //             onCheckedChanged: {

    //                 switchCustom.checked ? AppTheme.setTheme(AppTheme.Themes.UFODark) : AppTheme.setTheme(AppTheme.Themes.UFOLight)
    //             }
    //         }

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

    // Component.onCompleted: {
    //     UFOToast.displayMessage(UFOToast.Status.Success, "Operation completed!");
    // }
}

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Custom:
import Proxy

Item {
    id: root

    signal pageRequested(int index)

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

        Item {
            anchors.fill: parent
            anchors.topMargin: root.topMargin
            anchors.bottomMargin: root.bottomMargin
            anchors.rightMargin: root.rightMargin
            anchors.leftMargin: root.leftMargin

            ColumnLayout {
                id: columnLayout

                width: Math.min(1000, parent.width)
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                clip: false
                spacing: root.spacing

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Home")
                    elide: Text.ElideRight
                    font.family: AppFont.titilliumSemiBoldFont.family
                    font.weight: AppFont.titilliumSemiBoldFont.weight
                    font.styleName: AppFont.titilliumSemiBoldFont.styleName
                    font.pixelSize: Qt.application.font.pixelSize * AppFont.scalar2
                    wrapMode: Text.Wrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Hello and welcome to the home page of the UFO CODER website (built with Qt and WebAssembly). Here, I share my thoughts, ideas, and tutorials on coding and beyond. Feel free to explore and make yourself at home. Scroll down to check out my latest tutorials and posts. Want to know more about me and the projects I’m working on? Head over to the About page. Use the menu in the top-right corner to navigate around the site. Thanks for stopping by. I hope you enjoy your visit!")
                    textFormat: Text.PlainText
                    elide: Text.ElideRight
                    font.family: AppFont.titilliumLightFont.family
                    font.weight: AppFont.titilliumLightFont.weight
                    font.styleName: AppFont.titilliumLightFont.styleName
                    font.pixelSize: Qt.application.font.pixelSize * AppFont.scalar0
                    wrapMode: Text.Wrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }

                // Spacer:
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                }

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Search Tutorial")
                    elide: Text.ElideRight
                    font.family: AppFont.titilliumSemiBoldFont.family
                    font.weight: AppFont.titilliumSemiBoldFont.weight
                    font.styleName: AppFont.titilliumSemiBoldFont.styleName
                    font.pixelSize: Qt.application.font.pixelSize * AppFont.scalar2
                    wrapMode: Text.Wrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignLeft
                }

                UFOTextField {
                    id: textFieldTutorial

                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                }

                ListView {
                    id: listViewTutorial

                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.min(150, root.height * 0.25)

                    spacing: 5
                    clip: true

                    ListModel {
                        id: listModelTutorial

                        ListElement {
                            pageIndex: 2
                            tutorialName: "CMake"
                        }

                        ListElement {
                            pageIndex: 3
                            tutorialName: "Git"
                        }
                    }

                    Proxy {
                        id: proxyTutorial

                        sourceModel: listModelTutorial
                        roleText: "tutorialName"
                        filterValue: textFieldTutorial.text
                        sensitivityStatus: false
                    }

                    model: proxyTutorial

                    delegate: Rectangle {
                        width: listViewTutorial.width
                        height: 35

                        color: AppTheme.getColor(AppTheme.Colors.ListDelegateBackground)

                        RowLayout {
                            anchors.fill: parent

                            Text {
                                Layout.fillWidth: true
                                Layout.preferredHeight: 35
                                Layout.leftMargin: 10

                                text: model.tutorialName
                                elide: Text.ElideRight
                                font.family: AppFont.titilliumSemiBoldFont.family
                                font.weight: AppFont.titilliumSemiBoldFont.weight
                                font.styleName: AppFont.titilliumSemiBoldFont.styleName
                                font.pixelSize: Qt.application.font.pixelSize * AppFont.scalar0
                                wrapMode: Text.NoWrap
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                            }

                            UFOButton {
                                Layout.preferredHeight: 35

                                text: qsTr("Go")
                                icon.source: "qrc:/resources/icons/google/arrow_right_alt.svg"

                                onClicked: {
                                    root.pageRequested(model.pageIndex);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

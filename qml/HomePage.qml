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

                    text: qsTr("Search Tutorial")
                    elide: Text.ElideRight
                    font.family: AppFont.titilliumSemiBoldFont.family
                    font.weight: AppFont.titilliumSemiBoldFont.weight
                    font.styleName: AppFont.titilliumSemiBoldFont.styleName
                    font.pixelSize: Qt.application.font.pixelSize * 2.00
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
                    Layout.preferredHeight: 400

                    spacing: 5
                    clip: true

                    ListModel {
                        id: listModelTutorial

                        ListElement {
                            pageIndex: 1
                            tutorialName: "CMake"
                        }

                        ListElement {
                            pageIndex: 2
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
                                Layout.fillHeight: true
                                Layout.leftMargin: 10

                                text: model.tutorialName
                                elide: Text.ElideRight
                                font.family: AppFont.titilliumSemiBoldFont.family
                                font.weight: AppFont.titilliumSemiBoldFont.weight
                                font.styleName: AppFont.titilliumSemiBoldFont.styleName
                                font.pixelSize: Qt.application.font.pixelSize * 1.25
                                wrapMode: Text.NoWrap
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                            }

                            UFOButton {
                                Layout.fillHeight: true

                                text: qsTr("Go")
                                icon.source: "qrc:/resources/icons/arrow_right_alt.svg"

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

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

// Custom:
import Proxy

Item {
    id: root

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

                    text: qsTr("About me")
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

                    text: qsTr("Hi there! I’m Saviz Mohammadi, also known in the tech world as UFO Coder. I’m currently a computer science student at Simon Fraser University (SFU), where I’m diving deep into the fascinating world of technology. My focus areas include C/C++, Qt/QML, and CMake, and I’m always eager to tackle new challenges and expand my knowledge. My journey in coding has been a thrilling one, marked by hands-on experience with a variety of technologies. I thrive on solving complex problems and turning ideas into functional, efficient solutions. Whether I’m working on a new project or experimenting with different tech, my passion for coding drives me to continuously learn and innovate. Thanks for stopping by my corner of the web. I’m excited to connect with fellow tech enthusiasts and explore new opportunities in the ever-evolving tech landscape! Feel free to explore some of my projects and courses listed below.")
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

                    text: qsTr("Contact")
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

                    text: qsTr("My preferred method of contact is via direct email. Please note that response times may vary depending on my workload. You can also reach out to me on LinkedIn. Don’t forget to check out my GitHub page as well. Links to all contact methods and social media are provided below. You can send me a message if you have something important to discuss, or if you’d like to share general advice or new ideas.")
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

                RowLayout {
                    Layout.fillWidth: true

                    Item {
                        Layout.fillWidth: true
                    }

                    UFOButton {
                        Layout.preferredWidth: 50
                        Layout.preferredHeight: 35

                        display: AbstractButton.IconOnly
                        icon.source: "qrc:/resources/icons/google/mail.svg"

                        onClicked: {
                            contextClipboard.copyToClipboard("");
                        }
                    }

                    UFOButton {
                        Layout.preferredWidth: 50
                        Layout.preferredHeight: 35

                        display: AbstractButton.IconOnly
                        icon.source: "qrc:/resources/icons/flaticon/github.svg"

                        onClicked: {
                            Qt.openUrlExternally("");
                        }
                    }

                    UFOButton {
                        Layout.preferredWidth: 50
                        Layout.preferredHeight: 35

                        display: AbstractButton.IconOnly
                        icon.source: "qrc:/resources/icons/flaticon/linkedin.svg"

                        onClicked: {
                            Qt.openUrlExternally("");
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                    }
                }

                // Spacer:
                Item {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                }

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Search Projects")
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

                    text: qsTr("As a software developer, I dedicate much of my time to creating projects and templates using C/C++ and Qt/QML technologies. Feel free to explore some of my work below and see if anything catches your interest. Please feel free to reach out with any suggestions or advice on my projects. I welcome your feedback on areas that might need improvement, as well as any new ideas you might have.")
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

                UFOTextField {
                    id: textFieldProject

                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                }

                ListView {
                    id: listViewProject

                    Layout.fillWidth: true
                    Layout.preferredHeight: Math.min(150, root.height * 0.25)

                    spacing: 5
                    clip: true

                    ListModel {
                        id: listModelProject

                        ListElement {
                            projectName: "UFO_CMake"
                            projectDescription: ""
                            projectLink: "https://google.com"
                        }

                        ListElement {
                            projectName: "Git"
                            projectDescription: "Also a nice project"
                            projectLink: ""
                        }
                    }

                    Proxy {
                        id: proxyProject

                        sourceModel: listModelProject
                        roleText: "projectName"
                        filterValue: textFieldProject.text
                        sensitivityStatus: false
                    }

                    model: proxyProject

                    delegate: Rectangle {
                        readonly property int collapsedHeight: 35
                        readonly property int expandedHeight: columnLayoutDelegate.implicitHeight

                        width: listViewProject.width
                        height: buttonExpand.checked ? expandedHeight : collapsedHeight

                        color: AppTheme.getColor(AppTheme.Colors.ListDelegateBackground)

                        ColumnLayout {
                            id: columnLayoutDelegate

                            anchors.fill: parent

                            RowLayout {
                                Layout.fillWidth: true

                                spacing: 5

                                Text {
                                    Layout.fillWidth: true
                                    Layout.preferredHeight: 35
                                    Layout.leftMargin: 10

                                    text: model.projectName
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
                                    id: buttonExpand

                                    Layout.preferredWidth: 50
                                    Layout.preferredHeight: 35

                                    display: AbstractButton.IconOnly
                                    checkable: true
                                    checked: false
                                    icon.source: checked ? "qrc:/resources/icons/google/keyboard_arrow_up.svg" : "qrc:/resources/icons/google/keyboard_arrow_down.svg"
                                }

                                UFOButton {
                                    Layout.preferredHeight: 35

                                    text: qsTr("Go")
                                    icon.source: "qrc:/resources/icons/google/arrow_right_alt.svg"

                                    onClicked: {
                                        Qt.openUrlExternally(model.projectLink);
                                    }
                                }
                            }

                            Text {
                                id: textDescription

                                Layout.fillWidth: true
                                Layout.margins: 10

                                visible: buttonExpand.checked
                                text: model.projectDescription
                                elide: Text.ElideRight
                                font.family: AppFont.titilliumLightFont.family
                                font.weight: AppFont.titilliumLightFont.weight
                                font.styleName: AppFont.titilliumLightFont.styleName
                                font.pixelSize: Qt.application.font.pixelSize * AppFont.scalar0
                                wrapMode: Text.Wrap
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignLeft
                            }
                        }
                    }
                }
            }
        }
    }
}

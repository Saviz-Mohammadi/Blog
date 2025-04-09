import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Layouts

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

                    text: qsTr("CMake 001 - Introduction")
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

                    text: qsTr("The majority of programmers typically begin their coding journey in C and C++ with a \"Hello World\" application just like most other programming languages. However, what often remains poorly covered is the concept of how we can controll and instruct the underlying tools such as compilers and linkers and in general the environment in which we code to behave in a way that we want it to.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Most programming experiences focus solely on writing code without diving into how that code is transformed into a useful target such as executables and libraries. Often, interaction with compilers, linkers, and other management systems is limited to basic command-line instructions or simply handled by the programming environment (IDE). As a result, many developers proceed to more sufficticated programming concepts and technolgies without understanding the internal workings of these processes or how to customize their environments to better suit their needs and preferences.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Unlike languages like Rust or Python, which come with standardized tooling and package managers, C and C++ do not have a universal solution (at least before CMake), and the lack of standardization can be a major hurdle for beginners and experienced developers alike. What compiler, linker, resource manager, and other tools we deal with highly depends on the platform that we want to develop in when it comes to C and C++.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Many of us spend our time working under a dark cloud without a clear understanding of how things actually operate. We often find ourselves frustrated with tools like Visual Studio, Xcode, and other integrated environments or even just simple text editors that handle building projects and products for us. When we click that build button, we're left hoping for the best, only to be bombarded with confusing error messages that leave us scratching our heads.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Navigating the file structure and architecture imposed by integrated development environments (IDEs) can be confusing, especially for beginners. It's often unclear where to place files or libraries so that the IDE can properly detect and use them. Referencing header files becomes a hassle when we're forced to write out long, unwieldy paths, and if we want to change the default project structure to something that better fits our workflow, we’re rarely shown how.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Unfortunately, most tutorials and documentation gloss over these practical aspects, leaving us to figure things out through trial and error. This lack of transparency can be incredibly frustrating and ultimately detracts from the learning and development experience.")
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

                    text: qsTr("Conclusion")
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

                    text: qsTr("I strongly believe this teaching approach is flawed. Understanding your development environment is crucial for effective programming. Without this understanding, you're at the mercy of tools you can't fully control or troubleshoot when things go wrong. This frustration is something I've come to despise about many programming environments. It's as if you're expected to code blindfolded, with little insight into how everything fits together.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("These are just a few things that most beginner and even intermediate programmers struggle with. And of course we cannot blame them, no one has thought us how to do these things. This lack of foundational knowledge can lead to frustration when troubleshooting errors or attempting to customize projects. It's essential for developers to grasp these concepts early on, as they form the bedrock of effective programming practices.")
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

                Separator {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.topMargin: 30
                    Layout.bottomMargin: 30
                }

                Text {
                    Layout.fillWidth: true

                    text: qsTr("About CMake")
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

                    text: qsTr("You might say, \"Well, I can invest some time and effort to learn the tool and its environment\", and while that approach is reasonable, it’s important to remember that you’re only becoming proficient with that specific tool and environment. If you’re later required to use a different tool or environment, you’ll have to start the learning process all over again. If you learn Visual Studio, Xcode, or any other specific tool, you're only becoming proficient with that particular tool and its environment.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Not to mention that many programmers aim to write software that runs on multiple systems to reach a broader audience. This ambition brings the same challenges into focus: different environments and tools each have their own compilers, command-line parameters, architectural design choices, and other complexities. Managing this diversity can be quite overwhelming. Fortunately, we have a solution. These problems led to the development of tools like CMake.")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("CMake serves as a cross-platform build system generator designed to mitigate these issues. It enables developers to define their project's behavior and build requirements—such as compiler preferences, folder structures, and library dependencies—in a platform-agnostic manner. CMake accomplishes this by generating native build system files tailored to each target platform (e.g., Makefiles for Unix-like systems, Visual Studio project files for Windows). There's a saying in the community that summarizes CMake's role: \"CMake is a tool that builds the build system\".")
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

                Text {
                    Layout.fillWidth: true

                    text: qsTr("CMake's developers continued to refine the tool over time, improving documentation and addressing usability issues. As I gradually became more familiar with it, I recognized its power and versatility. However, CMake remains complex and can be difficult to master. Its attempt to accommodate various build systems, C/C++ versions, and platform-specific quirks adds to its learning curve. Moreover, CMake's surge in popularity happened relatively recently, leading to outdated tutorials, articles, and practices that may no longer be valid.")
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

                    text: qsTr("Conclusion")
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

                    text: qsTr("My initial experience with CMake was challenging. The error messages were cryptic, and the documentation was lacking, which deterred me from using it for some time. Despite my reluctance, CMake steadily gained traction among developers until it became the de facto standard for generating C/C++ build systems. Despite these challenges, your experience doesn't have to mirror mine. I'm here to help navigate through these complexities and minimize the headaches associated with build system management—at least as much as possible.")
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

                Separator {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 30
                    Layout.topMargin: 30
                    Layout.bottomMargin: 30
                }

                Text {
                    Layout.fillWidth: true

                    text: qsTr("Resources")
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

                    text: qsTr("Explaining CMake can be challenging. CMake involves many interconnected elements, commands, and concepts that work together to make the whole system function correctly. Therefore, utilizing reliable resources is crucial. The official CMake documentation is typically the best starting point.")
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

                UFOButton {
                    Layout.preferredHeight: 35

                    display: AbstractButton.TextOnly
                    text: "CMake Docs"

                    onClicked: {
                        Qt.openUrlExternally("https://cmake.org/documentation/");
                    }
                }
            }
        }
    }
}

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

                    text: qsTr("Many programmers begin their coding journey in C or C++ with the classic \"Hello, World!\" example, just like in most other programming languages. However, what often gets overlooked is how to control and configure the underlying tools that make the code actually work such as: the compiler, the linker, and the development environment. Most learning materials focus on writing code, without explaining how that code is turned into something usable like an executable or a library.")
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

                    text: qsTr("In most cases, interaction with these tools is limited to a few basic command-line instructions, or it's entirely abstracted away by an IDE. As a result, many developers move on to more advanced concepts without ever learning how the build process works or how to adapt it to fit their specific needs. Unlike languages like Rust or Python, which offer standardized tooling and package managers, C and C++ have traditionally lacked a unified ecosystem. Before tools like CMake became widely used, this absence of standardization made things especially difficult for beginners. In C and C++, the compiler, linker, and other tools you use depend heavily on the platform you're working with. That makes things more complicated from the start.")
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

                    text: qsTr("Many of us end up working in an environment we don’t fully understand. We rely on tools like Visual Studio, Xcode, or even simple text editors to manage builds for us. When we click the build button, we cross our fingers and hope everything just works. But more often than not, we’re met with cryptic error messages that only add to the confusion. Understanding how to organize your files, where to place libraries, or how to reference header files can feel like a guessing game. Trying to change the default project structure to match your personal workflow often leads to frustration, especially when tutorials and documentation barely touch on these topics. Trial and error becomes the norm.")
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

                    text: qsTr("It often feels like you're being asked to code without knowing how any of the parts actually fit together. And it’s not just beginners who deal with this, many intermediate programmers struggle with these same issues. The problem is not a lack of effort. It's that no one teaches this properly. Without a foundation in how these systems work, even small changes or errors can become overwhelming.")
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

                    text: qsTr("This lack of transparency makes programming more frustrating than it needs to be. I believe this teaching approach is flawed. Understanding your development environment is essential. Without that knowledge, you're stuck relying on tools you can’t properly control or fix when something breaks.")
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

                    text: qsTr("You might be thinking, \"I’ll just invest some time and learn the tool I’m using.\" That’s a reasonable idea, but it comes with limitations. When you become proficient in a single environment like Visual Studio or Xcode, you're gaining skills that are mostly tied to that specific tool. If you're later asked to switch to another environment, you'll have to start learning all over again. Things get even more complicated when you want to build software that runs on multiple platforms. Every platform has its own compilers, build tools, file structures, and command-line behaviors. Managing these differences can feel like an impossible task. Thankfully, there is a better solution. These challenges led to the creation of tools like CMake.")
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

                    text: qsTr("CMake is a cross-platform build system generator. It helps developers define how their project should be built — including compiler preferences, folder structures, and library dependencies — in a way that works across different platforms. CMake then generates the appropriate native build files for each target system. For example, it creates Makefiles for Unix-based systems and Visual Studio project files for Windows.")
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

                    text: qsTr("CMake has improved a lot over time. Its documentation is better, and many usability problems have been addressed. As I became more familiar with it, I started to appreciate how powerful and flexible it is. Still, CMake has a steep learning curve. It tries to support many different use cases, platforms, and compilers, which adds complexity. On top of that, many tutorials and articles available online are outdated, making it harder to learn.")
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

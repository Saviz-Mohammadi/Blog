import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Custom:
import SyntaxHighlighter

Item {
    id: root

    property string text: ""
    property alias languageName: syntaxHighlighter.languageName

    implicitWidth: 200
    implicitHeight: 200

    ColumnLayout {
        anchors.fill: parent

        Button {
            width: 120
            height: 35

            text: qsTr("Copy")

            onClicked: {
                // NOTE(SAVIZ): I want to use the normal copy() method of the TextEdit, but it seems like it has it's own problems with web technology being different.
                contextClipboard.copyToClipboard(textEdit.text);
            }
        }

        TextEdit {
            id: textEdit

            readOnly: true
            text: root.text

            SyntaxHighlighter {
                id: syntaxHighlighter

                document: textEdit.textDocument
            }
        }
    }
}

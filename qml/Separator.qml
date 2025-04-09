import QtQuick

Item {
    id: root

    property int radius: 0

    implicitWidth: 200
    implicitHeight: 200

    Rectangle {
        anchors.fill: parent

        color: AppTheme.getColor(AppTheme.Colors.Separator)
        radius: root.radius
    }
}

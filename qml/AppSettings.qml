pragma Singleton

import QtQuick
import QtCore

Item {
    id: root

    property alias currentTheme: themeSettings.currentTheme

    Settings {
        id: themeSettings

        category: "Theme"
        property int currentTheme: AppTheme.Themes.UFOLight
    }
}

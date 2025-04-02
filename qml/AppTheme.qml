pragma Singleton

import QtQuick

Item {
    id: root

    enum Themes {
        Light,
        Dark
    }

    enum Colors {
        SwitchCircle
    }

    QtObject {
        id: colorContainer

        // Basic:
        property color switchCircle: "transparent"
        property color switchCircleChecked: "transparent"
        property color switchCircleBorder: "transparent"
        property color switchBackground: "transparent"
        property color switchBackgroundBorder: "transparent"
    }

    function setTheme(theme) {
        let isSuccessful = true;

        switch(theme) {
        case AppTheme.Themes.Light:
            colorContainer.switchCircle = "tomato";
            break;
        case AppTheme.Themes.Dark:
            colorContainer.switchCircle = "white";
            break;
        default:
            isSuccessful = false
            break;
        }

        if(isSuccessful) {
            AppSettings.currentTheme = theme;
        }
    }

    function getColor(color) {
        let result = "transparent";

        switch(color) {
        case AppTheme.Colors.SwitchCircle:
            result = colorContainer.switchCircle;
            break;
        default:
            break;
        }

        return(result);
    }

    Component.onCompleted: {
        root.setTheme(AppSettings.currentTheme);
    }
}

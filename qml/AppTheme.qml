pragma Singleton

import QtQuick

Item {
    id: root

    // Theme names:
    enum Themes {
        UFOLight,
        UFODark
    }

    // Components' color:
    enum Colors {
        // Basic:
        WindowBackground,
        // Controls:
        SwitchCircle,
        ToastBackgroundSuccess,
        ToastBackgroundInfo,
        ToastBackgroundWarning,
        ToastBackgroundError,
        ToastIconSuccess,
        ToastIconInfo,
        ToastIconWarning,
        ToastIconError,
        ToastTextSuccess,
        ToastTextInfo,
        ToastTextWarning,
        ToastTextError
    }

    QtObject {
        id: predefinedColors

        // Lime:
        readonly property color lime100: "#EFFFD6"
        readonly property color lime200: "#D3F1A7"
        readonly property color lime300: "#B3DF72"
        readonly property color lime400: "#94C748"
        readonly property color lime500: "#82B536"
        readonly property color lime600: "#6A9A23"
        readonly property color lime700: "#5B7F24"
        readonly property color lime800: "#4C6B1F"
        readonly property color lime900: "#37471F"

        // Red:
        readonly property color red100: "#FFECEB"
        readonly property color red200: "#FFD5D2"
        readonly property color red300: "#FD9891"
        readonly property color red400: "#F87168"
        readonly property color red500: "#F15B50"
        readonly property color red600: "#E2483D"
        readonly property color red700: "#C9372C"
        readonly property color red800: "#AE2E24"
        readonly property color red900: "#5D1F1A"

        // Orange:
        readonly property color orange100: "#FFF3EB"
        readonly property color orange200: "#FEDEC8"
        readonly property color orange300: "#FEC195"
        readonly property color orange400: "#FEA362"
        readonly property color orange500: "#F38A3F"
        readonly property color orange600: "#E56910"
        readonly property color orange700: "#C25100"
        readonly property color orange800: "#A54800"
        readonly property color orange900: "#702E00"

        // Yellow:
        readonly property color yellow100: "#FFF7D6"
        readonly property color yellow200: "#F8E6A0"
        readonly property color yellow300: "#F5CD47"
        readonly property color yellow400: "#E2B203"
        readonly property color yellow500: "#CF9F02"
        readonly property color yellow600: "#B38600"
        readonly property color yellow700: "#946F00"
        readonly property color yellow800: "#7F5F01"
        readonly property color yellow900: "#533F04"

        // Green colors
        readonly property color green100: "#DCFFF1"
        readonly property color green200: "#BAF3DB"
        readonly property color green300: "#7EE2B8"
        readonly property color green400: "#4BCE97"
        readonly property color green500: "#2ABB7F"
        readonly property color green600: "#22A06B"
        readonly property color green700: "#1F845A"
        readonly property color green800: "#216E4E"
        readonly property color green900: "#164B35"

        // Teal:
        readonly property color teal100: "#E7F9FF"
        readonly property color teal200: "#C6EDFB"
        readonly property color teal300: "#9DD9EE"
        readonly property color teal400: "#6CC3E0"
        readonly property color teal500: "#42B2D7"
        readonly property color teal600: "#2898BD"
        readonly property color teal700: "#227D9B"
        readonly property color teal800: "#206A83"
        readonly property color teal900: "#164555"

        // Blue:
        readonly property color blue100: "#E9F2FF"
        readonly property color blue200: "#CCE0FF"
        readonly property color blue300: "#85B8FF"
        readonly property color blue400: "#579DFF"
        readonly property color blue500: "#388BFF"
        readonly property color blue600: "#1D7AFC"
        readonly property color blue700: "#0C66E4"
        readonly property color blue800: "#0055CC"
        readonly property color blue900: "#09326C"

        // Purple:
        readonly property color purple100: "#F3F0FF"
        readonly property color purple200: "#DFD8FD"
        readonly property color purple300: "#B8ACF6"
        readonly property color purple400: "#9F8FEF"
        readonly property color purple500: "#8F7EE7"
        readonly property color purple600: "#8270DB"
        readonly property color purple700: "#6E5DC6"
        readonly property color purple800: "#5E4DB2"
        readonly property color purple900: "#352C63"

        // Grey:
        readonly property color grey100: "#F8F9FA"
        readonly property color grey200: "#E9ECEF"
        readonly property color grey300: "#DEE2E6"
        readonly property color grey400: "#CED4DA"
        readonly property color grey500: "#ADB5BD"
        readonly property color grey600: "#6C757D"
        readonly property color grey700: "#495057"
        readonly property color grey800: "#343A40"
        readonly property color grey900: "#212529"
    }

    QtObject {
        id: componentColors

        // Basic:
        property color windowBackground: "transparent"

        // Controls:
        property color switchCircle: "transparent"
        property color switchCircleChecked: "transparent"
        property color switchCircleBorder: "transparent"
        property color switchBackground: "transparent"
        property color switchBackgroundBorder: "transparent"
        property color toastBackgroundSuccess: "transparent"
        property color toastBackgroundInfo: "transparent"
        property color toastBackgroundWarning: "transparent"
        property color toastBackgroundError: "transparent"
        property color toastIconSuccess: "transparent"
        property color toastIconInfo: "transparent"
        property color toastIconWarning: "transparent"
        property color toastIconError: "transparent"
        property color toastTextSuccess: "transparent"
        property color toastTextInfo: "transparent"
        property color toastTextWarning: "transparent"
        property color toastTextError: "transparent"
    }

    function setTheme(theme) {
        let isSuccessful = true;

        switch(theme) {
        case AppTheme.Themes.UFOLight:
            componentColors.windowBackground = predefinedColors.grey100;
            componentColors.toastBackgroundSuccess = predefinedColors.green200;
            componentColors.toastBackgroundInfo = predefinedColors.blue200;
            componentColors.toastBackgroundWarning = predefinedColors.yellow200;
            componentColors.toastBackgroundError = predefinedColors.red200;
            componentColors.toastIconSuccess = predefinedColors.green400;
            componentColors.toastIconInfo = predefinedColors.blue400;
            componentColors.toastIconWarning = predefinedColors.yellow400;
            componentColors.toastIconError = predefinedColors.red400;
            componentColors.toastTextSuccess = predefinedColors.green400;
            componentColors.toastTextInfo = predefinedColors.blue400;
            componentColors.toastTextWarning = predefinedColors.yellow400;
            componentColors.toastTextError = predefinedColors.red400;
            break;
        case AppTheme.Themes.UFODark:
            componentColors.windowBackground = predefinedColors.grey900;
            componentColors.toastBackgroundSuccess = predefinedColors.green200;
            componentColors.toastBackgroundInfo = predefinedColors.blue200;
            componentColors.toastBackgroundWarning = predefinedColors.yellow200;
            componentColors.toastBackgroundError = predefinedColors.red200;
            componentColors.toastIconSuccess = predefinedColors.green400;
            componentColors.toastIconInfo = predefinedColors.blue400;
            componentColors.toastIconWarning = predefinedColors.yellow400;
            componentColors.toastIconError = predefinedColors.red400;
            componentColors.toastTextSuccess = predefinedColors.green400;
            componentColors.toastTextInfo = predefinedColors.blue400;
            componentColors.toastTextWarning = predefinedColors.yellow400;
            componentColors.toastTextError = predefinedColors.red400;
            break;
        default:
            isSuccessful = false;
            break;
        }

        if(isSuccessful) {
            AppSettings.currentTheme = theme;
        }
    }

    function getColor(color) {
        let result = "transparent";

        switch(color) {
        // Basic:
        case AppTheme.Colors.WindowBackground:
            result = componentColors.windowBackground;
            break;
        // Controls:
        case AppTheme.Colors.ToastBackgroundSuccess:
            result = componentColors.toastBackgroundSuccess;
            break;
        case AppTheme.Colors.ToastBackgroundInfo:
            result = componentColors.toastBackgroundInfo;
            break;
        case AppTheme.Colors.ToastBackgroundWarning:
            result = componentColors.toastBackgroundWarning;
            break;
        case AppTheme.Colors.ToastBackgroundError:
            result = componentColors.toastBackgroundError;
            break;
        case AppTheme.Colors.ToastIconSuccess:
            result = componentColors.toastIconSuccess;
            break;
        case AppTheme.Colors.ToastIconInfo:
            result = componentColors.toastIconInfo;
            break;
        case AppTheme.Colors.ToastIconWarning:
            result = componentColors.toastIconWarning;
            break;
        case AppTheme.Colors.ToastIconError:
            result = componentColors.toastIconError;
            break;
        case AppTheme.Colors.ToastTextSuccess:
            result = componentColors.toastTextSuccess;
            break;
        case AppTheme.Colors.ToastTextInfo:
            result = componentColors.toastTextInfo;
            break;
        case AppTheme.Colors.ToastTextWarning:
            result = componentColors.toastTextWarning;
            break;
        case AppTheme.Colors.ToastTextError:
            result = componentColors.toastTextError;
            break;
        case AppTheme.Colors.SwitchCircle:
            result = componentColors.switchCircle;
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

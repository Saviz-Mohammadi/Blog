cmake_minimum_required(VERSION 3.16)

project(Blog VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/modules")

qt_add_executable(appBlog
    main.cpp
    ./resources/resources.qrc
)

set_source_files_properties(
    qml/AppTheme.qml
    qml/AppSettings.qml
    qml/AppFont.qml

    PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(appBlog
    URI Blog
    VERSION 1.0
    QML_FILES
        qml/Main.qml
        qml/AppTheme.qml
        qml/AppSettings.qml
        qml/AppFont.qml
        qml/UFOSwitch.qml
        qml/CodeBox.qml
	qml/UFOToast.qml
        qml/UFOButton.qml
        qml/HomePage.qml
        qml/Header.qml
        qml/NavigationMenu.qml
        qml/CMakePage.qml
        qml/CMakePart001.qml
        qml/CMakePart002.qml
        QML_FILES
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appBlog PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appBlog
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appBlog
    PRIVATE

    Qt6::Quick
    SyntaxHighlighterModulelib
    SyntaxHighlighterModulelibplugin
    FileIOModulelib
    FileIOModulelibplugin
    ClipboardModulelib
    ClipboardModulelibplugin
    ProxyModulelib
    ProxyModulelibplugin
)

include(GNUInstallDirs)
install(TARGETS appBlog
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

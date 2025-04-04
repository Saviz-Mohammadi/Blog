project("ProxyModule" VERSION 0.1 DESCRIPTION "A simple utility to handle filtering of a model." LANGUAGES CXX)

qt_add_qml_module("${PROJECT_NAME}lib"
    STATIC
    URI "ProxyModule"
    VERSION 0.1
    SOURCES
        "./include/proxy.hpp"
        "./src/proxy.cpp"
)

target_include_directories("${PROJECT_NAME}lib"
    PUBLIC

    "${CMAKE_CURRENT_SOURCE_DIR}/include"
)

target_link_libraries("${PROJECT_NAME}lib"
    PRIVATE

    Qt6::Core
    Qt6::Gui
    Qt6::Quick
)

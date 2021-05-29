cmake_minimum_required(VERSION 3.10)
project(PineScope VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 COMPONENTS Widgets PrintSupport REQUIRED)

add_executable(PineScope
    gui/mainwindow.ui
    gui/qcustomplot.cpp
    gui/mainwindow.cpp
    gui/main.cpp
    gui/resources.qrc
)
target_include_directories(PineScope PRIVATE ${CMAKE_SOURCE_DIR}/gui)

target_link_libraries(PineScope Qt5::Widgets Qt5::PrintSupport)

# Install desktop files and binaries.
install(TARGETS PineScope RUNTIME DESTINATION /usr/bin)
install(FILES images/PineScopeIcon.png DESTINATION /usr/share/icons)
install(FILES gui/PineScope.desktop DESTINATION /usr/share/applications)

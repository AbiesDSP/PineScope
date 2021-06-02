cmake_minimum_required(VERSION 3.10)
project(PineScope VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(QT_MOC_EXECUTABLE /usr/bin/moc)
add_executable(Qt5::moc IMPORTED)
set_property(TARGET Qt5::moc PROPERTY IMPORTED_LOCATION ${QT_MOC_EXECUTABLE})

set(CMAKE_AUTORCC ON)
set(QT_RCC_EXECUTABLE /usr/bin/rcc)
add_executable(Qt5::rcc IMPORTED)
set_property(TARGET Qt5::rcc PROPERTY IMPORTED_LOCATION ${QT_RCC_EXECUTABLE})

set(CMAKE_AUTOUIC ON)
set(QT_UIC_EXECUTABLE /usr/bin/uic)
add_executable(Qt5::uic IMPORTED)
set_property(TARGET Qt5::uic PROPERTY IMPORTED_LOCATION ${QT_UIC_EXECUTABLE})

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

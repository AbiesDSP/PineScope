cmake_minimum_required(VERSION 3.14)
project(PineScope VERSION 1.0.0 LANGUAGES CXX)

message(STATUS ${CMAKE_PREFIX_PATH})
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(QT_MOC_EXECUTABLE /usr/bin/moc)
add_executable(Qt5::moc IMPORTED)
set_property(TARGET Qt5::moc PROPERTY IMPORTED_LOCATION ${QT_MOC_EXECUTABLE})

set(CMAKE_AUTORCC ON)
set(QT_RCC_EXECUTABLE /usr/bin/rcc)
add_executable(Qt5::rcc IMPORTED)
set_property(TARGET Qt5::rcc PROPERTY IMPORTED_LOCATION ${QT_RCC_EXECUTABLE})

set(CMAKE_AUTOUIC OFF)
set(QT_UIC_EXECUTABLE /usr/bin/uic)
add_executable(Qt5::uic IMPORTED)
set_property(TARGET Qt5::uic PROPERTY IMPORTED_LOCATION ${QT_UIC_EXECUTABLE})

find_package(Qt5 COMPONENTS Widgets PrintSupport REQUIRED)

add_library(QCustomPlot SHARED qcustomplot.cpp)
target_include_directories(QCustomPlot PRIVATE ${CMAKE_SOURCE_DIR}/gui)
target_link_libraries(QCustomPlot Qt5::Widgets Qt5::PrintSupport)

add_executable(PineScope
    mainwindow.cpp
    main.cpp
    resources.qrc
)
# set_target_properties(PineScope PROPERTIES AUTOMOC TRUE)
target_include_directories(PineScope PRIVATE ${CMAKE_SOURCE_DIR}/gui)

target_link_libraries(PineScope QCustomPlot Qt5::Widgets Qt5::PrintSupport)

# Install desktop files and binaries.
install(TARGETS PineScope RUNTIME DESTINATION /usr/bin)
install(FILES images/PineScopeIcon.png DESTINATION /usr/share/icons)
install(FILES PineScope.desktop DESTINATION /usr/share/applications)

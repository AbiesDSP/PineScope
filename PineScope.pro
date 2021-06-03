QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets printsupport

CONFIG += c++11

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp \
    qcustomplot.cpp

HEADERS += \
    mainwindow.h \
    qcustomplot.h

FORMS += \
    mainwindow.ui

RC_ICONS = icon.png
# Default rules for deployment.
target.path = /usr/bin

icon.path = /usr/share/icons
icon.files = images/PineScopeIcon.png

desktop.path = /usr/share/applications
desktop.files = PineScope.desktop

INSTALLS += target icon desktop

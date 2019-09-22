QT += quick
CONFIG += c++11

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Refer to the documentation for the
# deprecated API to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        main.cpp \
    main.cpp \
    main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    Main.qml \
    Window.qml \
    list/A.qml \
    common/SectionContent.qml \
    common/SectionDescription.qml \
    common/SectionHeader.qml \
    common/SectionSpacer.qml \
    list/B.qml \
    list/C.qml \
    list/D.qml \
    list/E.qml \
    list/F.qml \
    list/G.qml \
    list/H.qml \
    list/I.qml \
    list/J.qml \
    list/K.qml \
    list/L.qml \
    list/M.qml \
    list/N.qml \
    list/O.qml \
    list/P.qml \
    list/Q.qml \
    list/R.qml \
    list/S.qml \
    list/T.qml \
    list/U.qml \
    list/V.qml \
    list/W.qml \
    list/X.qml \
    list/Y.qml \
    list/Z.qml

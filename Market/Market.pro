QT += qml quick sql

CONFIG += c++11

SOURCES += main.cpp \
        MDatabase.cpp\
        MDatabaseHelper.cpp \
    MDataBaseTableModel.cpp \
    MDisplayImage.cpp \
    MDataPromotion.cpp
HEADERS += MDatabase.h\
           MDatabaseHelper.h \
    MDataBaseTableModel.h \
    MDisplayImage.h \
    MDataPromotion.h

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    Basket.qml

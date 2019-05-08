﻿#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QPixmap>
#include <QApplication>
#include <QSplashScreen>
#include <QDateTime>
#include "serial/serialtest.h"


int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    SerialTest *serialtest = new SerialTest();
    engine.rootContext()->setContextProperty("serialtest",serialtest);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

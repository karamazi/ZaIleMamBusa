#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDate>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));


    QDate today = QDate::currentDate();
    qDebug() << today.dayOfWeek();

    return app.exec();
}

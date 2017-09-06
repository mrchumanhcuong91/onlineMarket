#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include <QSqlError>
#include "MDataBaseTableModel.h"
#include "MDisplayImage.h"
#include "MDataPromotion.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QString dbName( "/home/actiso/Test_DB/example.db" );
       QSqlDatabase db = QSqlDatabase::addDatabase( "QSQLITE" );
       db.setDatabaseName( dbName );

       if(db.open()){
           qDebug()<< "query to database successfully";
       }else{
           qDebug()<< "query to database failed"<< db.lastError();
       }
    MDataBaseTableModel *objectModel = new MDataBaseTableModel(0);
    MDataPromotion* modelPromotion = new MDataPromotion();
    modelPromotion->setSourceModel(objectModel);
    qDebug()<< objectModel->roleNames();
    QQmlApplicationEngine engine;
    qmlRegisterType<MDisplayImage>("ImageConnected",1,0,"MDisplayImage");
    engine.rootContext()->setContextProperty("modelSQL",objectModel);
    engine.rootContext()->setContextProperty("modelPromotion",modelPromotion);
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}

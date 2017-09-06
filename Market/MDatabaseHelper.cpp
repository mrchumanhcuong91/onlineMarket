#include "MDatabaseHelper.h"
#include <QDebug>
#include <QtSql>
#include <QSqlQuery>
#include <QSqlError>
/*
 * |productID|Name    |Type   |Vendor |Original|Price  |State  |Image|Promotion|
 * |CHAR(n)  |CHAR(n) |CHAR(n)|CHAR(n)|CHAR(n) |INT    |CHAR(n)|BLOB |INT      |
*/

MDatabaseHelper::MDatabaseHelper()
{

}
MDatabaseHelper::MDatabaseHelper(QString& path)
{
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName(path);

    if(m_db.open()){
        qDebug()<< "query to database successfully";
    }else{
        qDebug()<< "query to database failed"<< m_db.lastError();
    }
}
bool MDatabaseHelper::createTable(){
    bool success = false;

    QSqlQuery tableQuery(m_db);
    tableQuery.prepare("CREATE TABLE productMarket (productID VARCHAR(255),\
                                                    Name VARCHAR(255),\
                                                    Type VARCHAR(255),\
                                                    Vendor VARCHAR(255),\
                                                    Original VARCHAR(255),\
                                                    Price INTEGER,\
                                                    State VARCHAR(255),\
                                                    imageData BLOB,\
                                                    Promotion INTEGER)");
    if(tableQuery.exec()){
        qDebug()<< "Creat table successfully";
        success = true;
    }else {
        qDebug()<< "Create table failed"<<m_db.lastError();

    }
    tableQuery.finish();
    return success;

}
int MDatabaseHelper::get_last_id_record(){
    QSqlQuery lastQuery(m_db);
    lastQuery.prepare("SELECT * FROM imageData ORDER BY 1 DESC LIMIT 1;");
    if(lastQuery.exec()){
        qDebug()<< "find last success";
    }else {
        qDebug()<< "find last failed";
    }
    int idInit = lastQuery.record().indexOf("id");
    while(lastQuery.next()){
        int idLast = lastQuery.value(idInit).toInt();
    //    int idInit = id_last.toInt();
        qDebug() << "id last : "<<idLast;
        lastQuery.finish();
        return idLast;
    }

}

MDatabaseHelper::~MDatabaseHelper(){
    if(m_db.open())
        m_db.close();
}

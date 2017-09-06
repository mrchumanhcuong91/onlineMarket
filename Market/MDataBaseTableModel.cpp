#include "MDataBaseTableModel.h"
#include <QDebug>
#include <QSqlError>
#include <QSqlTableModel>
#include <QSqlRecord>
#include <QImage>
#include <QDebug>
#include <QByteArray>
#include <QSqlQuery>
#include <QSqlRecord>
#include <QModelIndex>
#include <QSqlError>
MDataBaseTableModel::MDataBaseTableModel()
{

}
MDataBaseTableModel::MDataBaseTableModel(QObject *parent):
    QSqlTableModel(parent)
{
    ////connectDb();
    QString nameTable = "productMarket";
    setTable(nameTable);
//    QSqlQuery queryObject;
//    queryObject.prepare("SELECT * FROM productMarket");
//    queryObject.exec();
//    this->setQuery(queryObject);
    select();
}
QVariant MDataBaseTableModel::data(const QModelIndex &idx, int role) const
{
    QVariant value;
    //qDebug()<<" row "<< idx.row() <<"role "<<role;
    if (idx.isValid()) {
        if (role < Qt::UserRole) {
            value = QSqlTableModel::data(idx, role);
        } else {
            int columnIdx = role - Qt::UserRole - 1;
            QModelIndex modelIndex = this->index(idx.row(), columnIdx);
            value = QSqlTableModel::data(modelIndex, Qt::DisplayRole);
            //imagedata is the name of blob type column
            //qDebug()<< "content" <<roleNames().value(role);
            if(roleNames().value(role) == "imageData")
                return QImage::fromData(value.toByteArray());//convert bytearray to QImage
        }
    }
    return value;
}
QHash<int, QByteArray> MDataBaseTableModel::roleNames() const
{
//    QHash<int, QByteArray> colums;
//    colums[Qt::UserRole] = "productID";
//    colums[Qt::UserRole+1] = "Name";
//    colums[Qt::UserRole+2] = "Type";
//    colums[Qt::UserRole+3] = "Vendor";
//[Qt::UserRole+4] = "Original";
//    colums[Qt::UserRole+5] = "Price";
//    colums[Qt::UserRole+6] = "State";
//    colums[Qt::UserRole+7] = "imageData";
//    colums[Qt::UserRole +8] = "Promotion";
//    return colums;
    QHash<int, QByteArray> roles;
    for (int i = 0; i < record().count(); i ++) {
        //qDebug() << "Row name :"<<record().fieldName(i).toUtf8();
        roles.insert(Qt::UserRole + i + 1, record().fieldName(i).toUtf8());
    }
    return roles;
}
void MDataBaseTableModel::connectDb(){
    m_db = QSqlDatabase::addDatabase("QSQLITE");
    m_db.setDatabaseName("/home/actiso/Test_DB/example.db");

    if(m_db.open()){
        qDebug()<< "query to database successfully";
    }else{
        qDebug()<< "query to database failed"<< m_db.lastError();
    }
}

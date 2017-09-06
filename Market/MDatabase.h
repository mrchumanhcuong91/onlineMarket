#ifndef MDATABASE_H
#define MDATABASE_H
#include <QtSql/QSql>
#include <QSqlDatabase>
#include "MDatabaseHelper.h"
class Mdatabase:public MDatabaseHelper
{
public:
    Mdatabase(QString& path):MDatabaseHelper(path){}

private:
    QSqlDatabase m_db;

};

#endif // MDATABASE_H

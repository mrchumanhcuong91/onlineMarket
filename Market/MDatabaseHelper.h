#ifndef MDATABASEHELPER_H
#define MDATABASEHELPER_H
#include <QtSql/QSql>
#include <QSqlDatabase>

class MDatabaseHelper
{
public:
    MDatabaseHelper();
    MDatabaseHelper(QString& path);
    bool createTable();
    bool addNewItem();
    bool insertNewItem();
    int get_last_id_record();
    ~MDatabaseHelper();
private:
    QSqlDatabase m_db;
};

#endif // MDATABASEHELPER_H

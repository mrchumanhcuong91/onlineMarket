#ifndef MDATABASETABLEMODEL_H
#define MDATABASETABLEMODEL_H
#include <QSqlTableModel>
#include <QSqlDatabase>

class MDataBaseTableModel:public QSqlTableModel
{
    Q_OBJECT
public:
    MDataBaseTableModel();
    explicit MDataBaseTableModel(QObject * parent =0);
    void connectDb();
    QVariant data(const QModelIndex &idx, int role) const Q_DECL_OVERRIDE;
    QHash<int, QByteArray> roleNames() const Q_DECL_OVERRIDE;
private:
    QSqlDatabase m_db;
};

#endif // MDATABASETABLEMODEL_H

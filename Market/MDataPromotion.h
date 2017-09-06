#ifndef MDATAPROMOTION_H
#define MDATAPROMOTION_H
#include <QSortFilterProxyModel>

class MDataPromotion : public QSortFilterProxyModel
{
public:
    MDataPromotion(QObject *parent = 0);
    virtual ~MDataPromotion();
    bool filterAcceptsRow(int source_row, const QModelIndex &source_parent) const override;
};

#endif // MDATAPROMOTION_H

#include "MDataPromotion.h"
#include <QDebug>
MDataPromotion::MDataPromotion(QObject *parent):
    QSortFilterProxyModel(parent)
{

}
bool MDataPromotion::filterAcceptsRow(int source_row, const QModelIndex &source_parent) const
{
    bool ret(false);
    if(this->sourceModel() != nullptr) {
        auto index = this->sourceModel()->index(source_row,0,source_parent);
        if(index.isValid()){
            auto valueRole = index.data(265);
            if(valueRole.isValid()){
                bool ok(false);
                auto value = valueRole.toInt(&ok);
                qDebug() <<"Value is"<<value;
                if(ok && value < 0)
                {
                    ret = true;
                }
            }
        }
    }
    return ret;
}
MDataPromotion::~MDataPromotion(){

}

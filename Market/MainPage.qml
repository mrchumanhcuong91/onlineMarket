import QtQuick 2.4
import QtQuick.Controls 2.0
Page {
    GridView {
        id: gridViewPro
        x: 50
        y: 100
        width: 1350
        height: 760
        model : modelSQL
        delegate: ItemDelegate{
            //if(index == 0)
            //if()

            id: deleGate
            //var valuePromotion = Promotion
            width: 450
            height: 320

            SubProduct{}
            MouseArea{
                anchors.fill: parent
                onClicked: stackView.push("qrc:/Detail.qml", {sub_name : Name, sub_vendor : Vendor, sub_image : imageData,sub_price:Price})
            }
        }
//        highlight: Rectangle {
//            width: 500
//            height :400
//            color: "red"; radius: 5
//        }
        focus: true
        cellWidth: 500
        cellHeight: 400
    }

}

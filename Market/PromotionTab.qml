import QtQuick 2.4
import QtQuick.Controls 2.0
Page{
    id:mainPromotionTab
    //signal transferData(string textData)

    ListView {
        id: gridViewPro
        x: 50
        y: 100
        width: 1350
        height: 760
        spacing: 5
        //mo    del : modelSQL
        model: modelPromotion
        /*
        delegate:Rectangle {
                      anchors.left: parent.left
                      anchors.right: parent.right
                      height: 100
                      width: parent.width/2
                      color: "steelblue"
                        Component.onCompleted:{
                            console.log("Name has : ", Name);
                        }

                      Text {

                          text: Name
                          anchors.centerIn: parent
                          font.bold: true
                          font.pixelSize: 20
                      }
                  }
                  */
        delegate: Rectangle{
            //if(index == 0)
            //if()


            id: deleGate
            //var valuePromotion = Promotion
            width: 450
            height: 320

            SubProduct{}
            MouseArea{
                anchors.fill: parent
                onClicked: stackViewPromotion.push("qrc:/Detail.qml", {sub_name : Name, sub_vendor : Vendor, sub_image : imageData,sub_price:Price})
            }
        }

    }
    Basket{
        id: basket
        visible: false
    }
        /*
        VisualDataModel{
            id: displayDelegateModel

            model: modelSQL
            groups: [
                VisualDataGroup{
                    includeByDefault: false
                    name: "promotion"
                }

            ]
            filterOnGroup: "promotion"
            Component.onCompleted: {
                var rowCount = modelSQL.count;
                items.remove(0,rowCount);
                for(var i=0;i < rowCount;i++){
                    var entry = modelSQL.get(i);
                    if(entry.Promotion < 0){
                        items.insert(entry,"promotion");
                    }
                }
            }
        }
            MouseArea{
                anchors.fill: parent
                onClicked: stackView.push("qrc:/Detail.qml", {sub_name : Name, sub_vendor : Vendor, sub_image : imageData})
            }

        focus: true
        cellWidth: 500
        cellHeight: 400
    }
    /*
    ListView {
            id: displayListView
            anchors.fill: parent
            spacing: 5
            //
            model: displayDelegateModel             // 6
        }

//        ListModel {                                 // 1
//            id: myModel
//            ListElement { vis: "One"; key: 0; }
//            ListElement { vis: "two"; key: 1; }
//            ListElement { vis: "Three"; key: 0; }
//            ListElement { vis: "Four"; key: 0; }
//            ListElement { vis: "Five"; key: 1; }
//            ListElement { vis: "Six"; key: 1; }
//            ListElement { vis: "Seven"; key: 0; }
//        }

        VisualDataModel {
            id: displayDelegateModel

            delegate:  Rectangle {
                anchors.left: parent.left
                anchors.right: parent.right
                height: 25
                color: "steelblue"

                Text {
                    text: Name
                    anchors.centerIn: parent
                    font.bold: true
                    font.pixelSize: 20
                }
            }

            model: modelSQL                          // 2

            groups: [
                VisualDataGroup {                   // 3
                    includeByDefault: false         // NECESSARY TO AVOID AUTOADDITION
                    name: "key0"
                }
            ]

            filterOnGroup: "key0"                   // 5

            Component.onCompleted: {                // 4
                var rowCount = modelSQL.count;
                console.log("value RowCount",rowCount);
                items.remove(0,rowCount);
                for( var i = 0;i < rowCount;i++ ) {
                    var entry = modelSQL.get(i);
                    if(Promotion < 0) {
                        items.insert(entry, "key0");
                    }
                }
            }

        }
        */
}

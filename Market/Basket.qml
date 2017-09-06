import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
ColumnLayout{

    id: test
    function slotHandler(sex, price,image){
        listviewBasket.model.append({"Name":sex,"Price":price,"imageData":image})
        console.log("count in list =",modelBasket.count)
        mainRoom.notify2Basket(listviewBasket.count);
        labelTotal.text =sum()
    }
ListView{

    property alias modelBasket: modelBasket
    property int total: 0

    id: listviewBasket


    anchors.leftMargin: 100
    anchors.bottomMargin: 200
    width: 400
    height: 400
    model: modelBasket
    delegate: Rectangle{
        width:listviewBasket.width
        height: 400
        RowLayout{
        x: 0
        y: 0
        width: 384
        height: 150
        spacing: 10
        SubProduct{}
        Rectangle{
            Text{
                text:"Remove"
            }

            Layout.minimumWidth: 100
            Layout.preferredWidth: 100
            Layout.maximumWidth: 300
            Layout.minimumHeight: 150
            color: "#ff61b3"
            anchors.leftMargin: 700
            MouseArea{
                anchors.fill: parent
                onClicked: {

                    listviewBasket.model.remove(index)
                    mainRoom.notify2Basket(listviewBasket.count);
                    labelTotal.text =sum()

                }
            }
        }
        Rectangle{
            width: 100
            height: 100
            color:"yellow"
            Text{
                text: Price
            }
        }

    }
//        ListView.onAdd: SequentialAnimation {
//           PropertyAction{
//               target: labelTotal
//               property: "text"
//               value:sum()
//           }//labelTotal.text = sum()}
//           /*PropertyAction{
//               target: labelCounts
//               property: "text"
//               value:getcount()
//           }*///labelTotal.text = sum()}

//        }

//        ListView.onRemove: SequentialAnimation {

//           PropertyAction{
//               target: labelTotal
//               property: "text"
//               value:sum()
//           }//labelTotal.text = sum()}
//           PropertyAction{
//               target: labelCount
//               property: "text"
//               value:getcount()
//           }//labelTotal.text = sum()}

//        }

}
    Component.onCompleted: {
        promotion2Basket.connect(test.slotHandler)
    }



    ListModel{
        id: modelBasket
    }


}

Connections{
    target: mainRoom
    onPromotion2Basket:{


    }
}

    function sum(){
        var total =0;
        var count = modelBasket.count;
        for(var i =0;i<count;i++){
            total+= modelBasket.get(i).Price;
        }
        return total;
    }
    function getcount(){
        return modelBasket.count;
    }


    Label{
        width:parent.width
        height: 100
        id:labelTotal
        text:"Hello"
    }
//    Label{
//        visible: false
//        width:parent.width
//        height: 100
//        id:labelCount
//        onTextChanged: {
//            console.log("onTextChanged count ",labelCount.text)
//            listviewBasket.setData(labelCount.text)
//        }
//    }


}

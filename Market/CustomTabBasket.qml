import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
TabButton {

    RowLayout{
        spacing: 0
        Rectangle{
            color:"black"
            id: mainBasket
            Text{
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Basket"
                color:"white"
            }

            Layout.minimumWidth: 100
            Layout.minimumHeight: 40
        }
        Rectangle{
            id: notify
            color: "black"
            Text{
                id:countInBasket
                visible: false
                anchors.centerIn: parent
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.top
                color:"red"
                //text:"3"
                font.pixelSize: 30
            }
            Layout.minimumWidth: 20
            Layout.minimumHeight: 40
            function onNotify2Basket(count){
                console.log("onNotify2Basket count ",count)
                if(count !== 0){
                    countInBasket.visible = true
                }else{
                    countInBasket.visible = false
                }

                countInBasket.text = count
            }

//            Connections{
//                target: mainRoom
//                onNotify2Basket:{
//                    //console.log("onNotify2Basket count ",count)
//                    if(count != 0){
//                        countInBasket.visible = true
//                    }else{
//                        countInBasket.visible = false
//                    }

//                    countInBasket.text = count
//                }
//            }

            Component.onCompleted: {
                notify2Basket.connect(notify.onNotify2Basket)
            }
        }

    }

}

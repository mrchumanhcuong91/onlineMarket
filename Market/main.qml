import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import ImageConnected 1.0
ApplicationWindow {
    id: mainRoom
    signal promotion2Basket(string sex, int price, var image)
    signal notify2Basket(int count)
    visible: true
    width: 1350
    height: 760
    title: qsTr("Hello World")
    header: ColumnLayout{
        spacing: 2
        ToolBar{
            width: parent
            anchors.fill: parent.fillWidth
            Layout.fillWidth: parent.width
        Label{
            text: qsTr("Market")
            font.pixelSize: 50
            anchors.centerIn: parent
        }

        }
        TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("MainPage")
        }
        TabButton {
            text: qsTr("Promotion")
        }
        CustomTabBasket {
            id:tabBasket
            //text: qsTr("Basket")
        }
        }
    }


    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
            StackView{
                id: stackView
                anchors.fill: parent
                initialItem: MainPage{}
            }
        }

        Page {
            StackView{
                id: stackViewPromotion
                anchors.fill: parent
                initialItem: PromotionTab{}
            }
        }
//        Page {
            Basket {
                id: basket
//                text: qsTr("3 page")
//                anchors.centerIn: parent
            }
//        }
    }

    footer:ToolBar{
        Label{
            //text: qsTr("Market")
            font.pixelSize: 50
            anchors.centerIn: parent

        }
    }

}

//}

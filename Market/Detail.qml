import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ImageConnected 1.0

Page {
    id:pageDetail
//    function giveData(text,price,image){
//        mainRoom.promotion2Basket(text,price,image);
//    }
    property string sub_name
    property string sub_vendor
    property string sub_original
    property string sub_type
    property string sub_price
    property string sub_promotion
    property var sub_image

    header:ToolBar{
        ToolButton{
            text: qsTr("Back")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 50
            onClicked: stackView.pop()

        }
        ToolButton{
            text: qsTr("Back_promotion")
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 200
            onClicked: stackViewPromotion.pop()

        }
    }

//    Label {
//        text: "My Name is " + man
//        anchors.centerIn: parent
//    }
    ColumnLayout{
        spacing: 0
        Rectangle{
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 450
            Layout.preferredHeight: 300
            RowLayout{
                spacing: 0
                Rectangle{

                    id: imagePlace
                    Layout.minimumWidth: 150
                    Layout.minimumHeight: 300
                    MDisplayImage{
                        id: newImage
                        width: 150
                        height:300
                        anchors.fill: parent
                        anchors.horizontalCenter: parent.horizontalCenter
                        image: sub_image //imagedata is a column of my database has type BLOB
                    }

    //                color: "#e0e1c5"
    //                Text{
    //                    text: number
    //                }

                }
                Rectangle{
                    id:infor
                    color: "#eeffff"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                    scale: 1
                    antialiasing: false
                    smooth: true
                    rotation: 0
                    Layout.minimumWidth: 300
                    Layout.minimumHeight: 300

                    ColumnLayout{
                        spacing: 0
                        x: 0
                        y: 0
                        width: 300
                        Rectangle{

                            color: "#F5FCF6"
                            ColumnLayout{

                                x: 0
                                y: 0
                                width: 300
                                spacing : 2
                                //|productID|Name    |Type   |Vendor |Original|Price  |State  |Image|Promotion
    //                        TextField{
    //                            TextFieldStyle {
    //                                textColor: "black"
    //                                background: Rectangle {
    //                                    width: parent
    //                                Text{
    //                                    text : Original //Original display fine in UI, it is collumn name of my database
    //                                }
    //                                radius: 10
    //                                border.color: "red"
    //                                border.width: 3
    //                                }
    //                            }
    //                        }
                            TextField {
                                text: sub_name
                                font.family: "Times New Roman"
                                topPadding: 18

                                Layout.fillWidth: true
                                width: 300
                                readOnly: true
                            }
                            TextField {
                                width: 300
                                text: sub_vendor
                                Layout.fillWidth: true
                                readOnly: true
                             }
                            TextField {
                                width: 300
                                text: sub_original
                                Layout.fillWidth: true
                                readOnly: true
                             }
                            TextField {
                                width: 300
                                text: sub_price
                                Layout.fillWidth: true
                                readOnly: true
                            }

                            TextField {
                                width: 300
                                text: sub_promotion
                                Layout.fillWidth: true
                                readOnly: true
                             }
    //                        TextField {
    //                             width: 300
    //                             text: myModel.State
    //                             readOnly: true
    //                         }
                            Button{
                                width:300
                                height: 100
                                id:mybutton

                                Text{
                                    text:"Bye Now"

                                }
                                onClicked: mainRoom.promotion2Basket(sub_name,sub_price,sub_image)
                            }
                            Layout.minimumWidth: 300
                            Layout.minimumHeight: 270
                            //color: "#df745a"
                            }
                        }
    //                    Rectangle{
    //                        color :"yellow"
    //                        Button{
    //                            Layout.minimumWidth: 300
    //                            Layout.minimumHeight: 30
    ////                            anchors.fill: parent
    //                            x: 0
    //                            y: 247
    //                            width: parent.width
    //                            height: 50
    //                        }

    //                    }
                    }
                }

            }

        }
        Rectangle{
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: 450
            Layout.preferredHeight: 20
            color: "#8dd321"
    //        Text{
    //            text:name
    //        }
        }
    }
}

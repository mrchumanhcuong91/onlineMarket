import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import ImageConnected 1.0

ColumnLayout{

    property alias newImage: newImage
    //property bool  name: value
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
                    image: imageData //imagedata is a column of my database has type BLOB
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
                            text: Name
                            font.family: "Times New Roman"
                            topPadding: 18

                            Layout.fillWidth: true
                            width: 300
                            readOnly: true
                        }
                        TextField {
                            width: 300
                            text: Vendor
                            Layout.fillWidth: true
                            readOnly: true
                         }
                        TextField {
                            width: 300
                            text: Original
                            Layout.fillWidth: true
                            readOnly: true
                         }
                        TextField {
                            width: 300
                            text: Price
                            Layout.fillWidth: true
                            readOnly: true
                        }

                        TextField {
                            width: 300
                            text: Promotion
                            Layout.fillWidth: true
                            readOnly: true
                         }
//                        TextField {
//                             width: 300
//                             text: myModel.State
//                             readOnly: true
//                         }

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
//    MouseArea{
//        anchors.fill: parent
//        onClicked: stackView.push("qrc:/Detail.qml", {sub_name : Name, sub_vendor : Vendor, sub_image : imageData})
//    }
}


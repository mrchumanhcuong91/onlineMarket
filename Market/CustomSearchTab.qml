import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
TabButton {
    width: 300

    RowLayout{

        height: 40
        spacing: 0
        TextField{
            TextEdit {
            id: textEdit
            width: 200
            height: 50

            property string placeholderText: "Enter text here..."

            Text {
                text: textEdit.placeholderText
                color: "#E0DEDD"
                visible: !textEdit.text
            }
        }
        }
        Image {
            width: parent.width
            id: icon_search

            source: "qrc:/ic_search_pressed.png"
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: parent.height
        }


    }

}

import QtQuick 2.0
import QtQuick.Controls 2.0
VisualDataModel{
    //if(index == 0)
    //if()

    id: displayDelegateModel
    //var valuePromotion = Promotion

    SubProduct{}
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

    MouseArea{
        anchors.fill: parent
        onClicked: stackView.push("qrc:/Detail.qml", {sub_name : Name, sub_vendor : Vendor, sub_image : imageData})
    }
}

import QtQuick 2.0

Rectangle {
    id: scheduleItem
    property var model
    property var currentDate
    property bool isNext: false


    width: timeText.implicitWidth
    height: timeText.implicitHeight * 1.5

    color: (currentDate && isNext) ? "#99c0ff" : (index % 2 == 0 ? "white" : "#dbe8fc")
    opacity: (currentDate && currentDate > model.date) ? 0.4 : 1

    Text {
        id: timeText
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        font.pointSize: 20
        color: "black"
        text: scheduleItem.model.date.toLocaleString(Qt.locale("de_DE"), "HH:mm")
        font.family: fontLato.name
    }
    Text {
        id: timeToLeave
        anchors.verticalCenter: timeText.verticalCenter
        anchors.left: timeText.right
        anchors.leftMargin: 10
        color: "black"
        text: time2departure()
        font.pointSize: 10
    }
    Text {
        id: leavePlaceText
        text: scheduleItem.model.station
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.verticalCenter: timeToLeave.verticalCenter
        color: "black"
        font.pointSize: 10
    }

    function time2departure(){
        if(!currentDate)
            return ""

        var seconds = Math.floor((scheduleItem.model.date - currentDate)/1000);
        if(seconds < 0){
            return "Pojechał"
        }
        var minutes = Math.floor(seconds/60);
        seconds = seconds%60;
        var hours = Math.floor(minutes/60);
        minutes = minutes%60;

        var t = plural(minutes, "minut")

        if(hours > 0){
            t = plural(hours, "godzin")+" "+t
        }
        return t
    }
    function plural(count, word){
        var p = ""+count+" "+word
        if(count === 1)
            p+="a"
        else if(count < 4)
            p+="y"
        return p
    }
}

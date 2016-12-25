import QtQuick 2.0

Rectangle {
    id: dateTimeRect
    property var currentDate

    color: "darkgreen"
    height: (todayDayText.implicitHeight + todaysTimeText.implicitHeight) * 1.1
    width: parent.width

    Text {
        id: todayDayText
        text: dateTimeRect.currentDate.toLocaleString(Qt.locale("pl_PL"), 'dddd, dd MMMM')
        font.pointSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        font.family: fontLato.name
    }
    Text {
        id: todaysTimeText
        text: dateTimeRect.currentDate.toLocaleString(Qt.locale("pl_PL"), 'HH:mm:ss')
        font.pointSize: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        font.family: fontLato.name
    }
}

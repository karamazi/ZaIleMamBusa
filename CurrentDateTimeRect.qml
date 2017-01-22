import QtQuick 2.0

Rectangle {
    id: dateTimeRect
    property var currentDate

    color: "lightblue"
    height: (todayDayText.implicitHeight + todaysTimeText.implicitHeight) * 1.1
    width: parent.width

    Text {
        id: todayDayText
        text: dateTimeRect.currentDate.toLocaleString(Qt.locale("pl_PL"), 'dddd, dd MMMM')

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
                font.pointSize: 20
        font.family: fontLato.name
    }
    Text {
        id: todaysTimeText
        text: dateTimeRect.currentDate.toLocaleString(Qt.locale("pl_PL"), 'HH:mm:ss')

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        font.pointSize: 20
        font.family: fontLato.name
    }
}

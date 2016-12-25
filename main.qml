import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: qsTr("Hello World")

    ScheduleData {
        id: scheduleData
    }

    FontLoader {
        id: fontLato
        source: "assets/fonts/Lato-Regular.ttf"
    }

    CurrentDateTimeRect {
        id: header
        currentDate: scheduleData.currentDate
        z: 1
    }
    ListView {
        anchors {
            top: header.bottom
            bottom: parent.bottom
        }
        width: parent.width

        snapMode: ListView.SnapToItem

        model: scheduleData.schedule
        delegate: ScheduleItemView {
            width: parent.width
            busTime: modelData.date
            station: modelData.station
            isNext: index == scheduleData.nextBusIndex
        }
    }
}

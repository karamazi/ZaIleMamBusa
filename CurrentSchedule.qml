import QtQuick 2.0

Item {
    ScheduleData {
        id: scheduleData
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
            model: modelData
            isNext: index == scheduleData.nextBusIndex
            currentDate: scheduleData.currentDate
        }
    }
}

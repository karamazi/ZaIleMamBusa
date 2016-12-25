import QtQuick 2.0
import QtQuick.Controls 2.0
import "data"

Item {
    RegularDayData {
        id: regularDayData
    }
    SaturdayData {
        id: saturdayData
    }
    SundayData {
        id: sundayData
    }



    SwipeView {
        id: schedules
        anchors.top: tabs.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        currentIndex: tabs.currentIndex

        ListView {
            model: regularDayData.schedule
            delegate: ScheduleItemView {
                width: parent.width
                model: modelData
            }
        }
        ListView {
            model: saturdayData.schedule
            delegate: ScheduleItemView {
                width: parent.width
                model: modelData
            }
        }
        ListView {
            model: sundayData.schedule
            delegate: ScheduleItemView {
                width: parent.width
                model: modelData
            }
        }
    }

    TabBar {
        id: tabs
        width: parent.width
        TabButton {
            text: "pn-pt"
        }
        TabButton {
            text: "sob"
        }
        TabButton {
            text: "nd"
        }
        currentIndex: schedules.currentIndex
    }

}

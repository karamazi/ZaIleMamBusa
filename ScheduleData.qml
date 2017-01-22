import QtQuick 2.0
import QtQml 2.2
import "ScheduleItemModel.js" as Models

Item {
    id: scheduleData
    property date currentDate: new Date();
    property int offsetHours: 1
    property int offset: offsetHours * 3600 * 1000;
    property int dayOfTheWeek: currentDate.getDay()

    property alias busData: dataLoader.item
    Loader {
        id: dataLoader
        source: {
            if(dayOfTheWeek  == 0)
                return "data/SundayData.qml"
            if(dayOfTheWeek == 6)
                return "data/SaturdayData.qml"
            return "data/RegularDayData.qml"
        }
    }

    function notInPast(element, index, array){
        return (element.date - currentDate) >= -offset;
    }

    property var schedule: busData.schedule.filter(notInPast);

    property int nextBusIndex: {
        for(var i=0;i<schedule.length;i++){
            if(schedule[i].date <= currentDate)
                continue;
            return i;
        }
        return 5
    }

    Timer {
        running: true
        repeat: true
        onTriggered: {
            scheduleData.currentDate = new Date();
        }

        interval: 1000
    }

}

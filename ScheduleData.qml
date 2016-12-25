import QtQuick 2.0
import QtQml 2.2
import "ScheduleItemModel.js" as Models

Item {
    id: scheduleData
    property date currentDate: new Date();
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


    function parsed(data, place){
        var dates = []
        for(var i=0;i<data.length;i++){
            var d = new Date();
            d.setHours(data[i][0])
            d.setMinutes(data[i][1])
            d.setMilliseconds(0);
            dates.push(new Models.ScheduleModel(d, place));
        }
        return dates;
    }
    function byDate(a,b){
       return a.date<b.date ? -1 : a.date===b.date ? 0 : 1
    }

    property var schedule: parsed(busData.mbm, "Ogrodowa")
                           .concat(parsed(busData.koczwara, "MDA"))
                           .sort(byDate);


    property int nextBusIndex: {
        console.log(schedule.length)
        for(var i=0;i<schedule.length;i++){
            if(schedule[i].date <= currentDate)
                continue;
            return i;
        }
        return 5
    }

    Component.onCompleted: {
        var yesterday = new Date(currentDate.setDate(currentDate.getDate()-1));
        console.log(currentDate, yesterday, currentDate-yesterday)
    }

    Timer {
        running: true
        repeat: true
        onTriggered: scheduleData.currentDate = new Date();
        interval: 1000
    }

}

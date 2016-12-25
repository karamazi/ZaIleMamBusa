import QtQuick 2.0
import "../ScheduleItemModel.js" as Models

Item {
    property var koczwara
    property var mbm

    readonly property var schedule: parsed(mbm, "Ogrodowa")
                                    .concat(parsed(koczwara, "MDA"))
                                    .sort(byDate)

    function byDate(a,b){
       return a.date<b.date ? -1 : a.date===b.date ? 0 : 1
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


}

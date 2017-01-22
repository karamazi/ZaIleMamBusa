import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

ApplicationWindow {
    visible: true
    width: 360
    height: 640
    title: qsTr("Hello World")


    FontLoader {
        id: fontLato
        source: "assets/fonts/Lato-Regular.ttf"
    }

    Item {
        id: content
        anchors {
            top: parent.top
            bottom: switchButton.top
        }
        width: parent.width

        CurrentSchedule {
            id: currentSchedule
            anchors.fill: parent
        }

        WeeklySchedule {
            id: weeklySchedule
            anchors.fill: parent
            visible: !currentSchedule.visible
        }

    }

    Button {
        id: switchButton
        text: currentSchedule.visible ? "Zobacz całościowo." : "Zobacz najbliższe."
        anchors.bottom: parent.bottom
        width: parent.width
        onClicked: currentSchedule.visible = !currentSchedule.visible

        contentItem: Text {
            font.pointSize: 20
            font.family: fontLato.name
            text: switchButton.text
            horizontalAlignment: Text.AlignHCenter
        }
    }
}

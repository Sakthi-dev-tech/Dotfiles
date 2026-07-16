import Quickshell
import QtQuick

Text {
    text: Qt.formatDateTime(clock.date, "hh:mm")
    color: "white"
    anchors.centerIn: parent

    font {
        family: "SF Pro Display"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}

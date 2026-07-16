import Quickshell
import QtQuick

import ".."

Text {
    readonly property alias date: systemClock.date

    text: Qt.formatDateTime(systemClock.date, "hh:mm")
    color: "white"
    anchors.centerIn: parent

    font {
        family: "SF Pro Display"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
    }

    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
    }
}

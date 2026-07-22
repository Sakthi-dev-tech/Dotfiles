import Quickshell
import QtQuick
import QtQuick.Layouts

import ".."

ColumnLayout {
    id: root
    anchors.centerIn: parent

    required property bool expanded
    readonly property alias date: systemClock.date

    Text {
        text: Qt.formatDateTime(root.date, "hh:mm")
        color: "white"
        Layout.alignment: Qt.AlignHCenter

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

    Text {
        visible: root.expanded

        text: Qt.formatDateTime(root.date, "dddd, MMMM d")
        color: Theme.onBackgroundText
        Layout.alignment: Qt.AlignHCenter

        opacity: root.expanded ? 0.75 : 0

        font {
            family: "SF Pro Display"
            pixelSize: 10
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 120
            }
        }
    }
}

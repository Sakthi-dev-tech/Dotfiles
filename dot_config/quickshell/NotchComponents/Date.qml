import QtQuick

Text {
    required property var clockItem
    required property var notchItem

    anchors {
        top: clockItem.bottom
        topMargin: 3
        horizontalCenter: parent.horizontalCenter
    }

    text: Qt.formatDateTime(clockItem.date, "dddd, MMMM d")
    color: "white"
    opacity: notchItem.expanded ? 0.75 : 0
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

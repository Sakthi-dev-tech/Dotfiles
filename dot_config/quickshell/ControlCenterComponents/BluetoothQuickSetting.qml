import Quickshell.Bluetooth
import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
    id: root

    property var adapter: Bluetooth.defaultAdapter
    readonly property bool active: adapter?.enabled ?? false

    implicitWidth: 250
    implicitHeight: 60
    Layout.fillWidth: true

    radius: Constants.radiusForElems
    color: active ? Theme.bluetoothColour : Qt.lighter(Theme.background, 1.2)

    RowLayout {
        anchors {
            fill: parent
            leftMargin: 12
            rightMargin: 12
        }
        spacing: 10

        Rectangle {
            implicitWidth: 36
            implicitHeight: 36
            radius: 18
            color: root.active ? Qt.darker(Theme.bluetoothColour, 1.15) : Qt.lighter(Theme.background, 1.5)

            Text {
                anchors.centerIn: parent
                text: String.fromCodePoint(root.active ? 0xf00af : 0xf00b2)
                color: root.active ? Theme.background : Theme.bluetoothColour
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 16
            }
            MouseArea {
                anchors.fill: parent
                enabled: !!root.adapter
                cursorShape: enabled ? Qt.PointingHandCursor : Qt.ArrowCursor
                onClicked: root.adapter.enabled = !root.adapter.enabled
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            Text {
                Layout.fillWidth: true
                text: "Bluetooth"
                color: root.active ? Theme.background : Theme.onBackgroundText
                font.family: "SF Pro Display"
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                Layout.fillWidth: true
                text: root.active ? "On" : "Off"
                color: root.active ? Theme.background : Theme.onBackgroundText
                opacity: 0.75
                font.family: "SF Pro Display"
                font.pixelSize: 11
            }
        }
    }
}

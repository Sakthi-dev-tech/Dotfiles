import Quickshell.Networking
import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
    id: root

    property var wifiDevice: Networking.devices.values.find(device => device.type === DeviceType.Wifi)
    property var activeNetwork: wifiDevice?.networks.values.find(network => network.connected) ?? null
    readonly property bool active: Networking.wifiEnabled

    implicitWidth: 250
    implicitHeight: 60
    Layout.fillWidth: true

    radius: Constants.radiusForElems
    color: active ? Theme.networkColour : Qt.lighter(Theme.background, 1.2)

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
            color: root.active ? Qt.darker(Theme.networkColour, 1.15) : Qt.lighter(Theme.background, 1.5)

            Text {
                anchors.centerIn: parent
                text: String.fromCodePoint(root.active ? 0xf0928 : 0xf05aa)
                color: root.active ? Theme.background : Theme.networkColour
                font.family: "JetBrainsMono Nerd Font"
                font.pixelSize: 16
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.OpenHandCursor
                onClicked: Networking.wifiEnabled = !Networking.wifiEnabled
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            spacing: 0

            Text {
                text: "Wi-Fi"
                color: root.active ? Theme.background : Theme.onBackgroundText
                font.family: "SF Pro Display"
                font.bold: true
                font.pixelSize: 14
            }

            Text {
                Layout.fillWidth: true
                text: !root.active ? "Off" : root.activeNetwork?.name ?? "On"
                color: root.active ? Theme.background : Theme.onBackgroundText
                opacity: 0.75
                elide: Text.ElideRight
                font.family: "SF Pro Display"
                font.pixelSize: 11
            }
        }
    }
}

import Quickshell
import Quickshell.Networking
import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
  id: root
  color: Theme.background

  property var wifiDevice: Networking.devices.values.find(d => d.type === DeviceType.Wifi)
  property var active: wifiDevice ? wifiDevice.networks.values.find(n => n.connected) : null

  readonly property real signal: active ? active.signalStrength : 0

  readonly property string icon: {
    if (!Networking.wifiEnabled) return String.fromCodePoint(0xF05AA)
    if (!active) return String.fromCodePoint(0xF092D)

    let tier = signal >= 0.75 ? 4
            : signal >= 0.50 ? 3
            : signal >= 0.25 ? 2
            : 1

    return String.fromCodePoint(0xF091F + (tier - 1) * 3)
  }

  implicitWidth: row.implicitWidth + Constants.widgetWidthPadding
  implicitHeight: row.implicitHeight + Constants.widgetHeightPadding

  radius: Constants.radiusForElems

  RowLayout {
    id: row
    spacing: 7

    anchors.centerIn: parent

    Text {
      text: root.icon
      color: Theme.networkColour

      font {
        family: "JetBrainsMono Nerd Font"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
      }
    }

    Text {
      text: {
        if (!Networking.wifiEnabled) return "Off"
        if (!root.active) return "Disconnected"

        return root.active.name
      }

      color: Theme.networkColour

      font {
        family: "SF Pro Display"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
      }
    }

  }
}

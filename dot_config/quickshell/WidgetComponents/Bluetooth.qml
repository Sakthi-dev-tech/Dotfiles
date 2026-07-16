import Quickshell
import Quickshell.Bluetooth
import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
  id: root
  color: Theme.background

  implicitWidth: row.implicitWidth + Constants.widgetWidthPadding
  implicitHeight: row.implicitHeight + Constants.widgetHeightPadding

  property var bt: Bluetooth.defaultAdapter
  property bool isEnabled: bt.state === BluetoothAdapterState.Enabled

  readonly property string icon: {
    if (isEnabled) return String.fromCodePoint(0xf00af)

    return String.fromCodePoint(0xf00b2)
  }

  radius: Constants.radiusForElems

  RowLayout {
    id: row
    spacing: 7

    anchors.centerIn: parent

    Text {
      text: root.icon

      color: Theme.bluetoothColour

      font {
        family: "JetBrainsMono Nerd Font"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
      }
    }

    Text {
      text: {
        if (root.isEnabled) return "On"

        return "Off"
      }

      color: Theme.bluetoothColour

      font {
        family: "SF Pro Display"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
      }
    }
  }
}

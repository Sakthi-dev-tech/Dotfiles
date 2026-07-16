import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
  id: root
  color: Theme.background

  property var battery: UPower.displayDevice
  property bool charging: battery.state === UPowerDeviceState.Charging
  readonly property int level: Math.round(battery.percentage * 100)

  readonly property string icon: {
    if (charging) return String.fromCodePoint(0xF0084)
    if (level >= 100) return String.fromCodePoint(0xF0079)
    if (level < 10) return String.fromCodePoint(0xF0083)

    return String.fromCodePoint(0xF007A + (Math.floor(level / 10) - 1))
  }
  
  // Only renders battery widget if device is a laptop
  visible: level > 0

  implicitWidth: row.implicitWidth + Constants.widgetWidthPadding
  implicitHeight: row.implicitHeight + Constants.widgetHeightPadding

  radius: Constants.radiusForElems

  RowLayout {
    id: row
    spacing: 7

    anchors.centerIn: parent

    Text {
      text: root.icon
      color: Theme.batteryColour

      font {
        family: "JetBrainsMono Nerd Font"
        pixelSize: Constants.widgetTextPixelSize
      }
    }

    Text {
      text: root.level + "%"
      color: Theme.batteryColour

      font {
        family: "SF Pro Display"
        bold: true
        pixelSize: Constants.widgetTextPixelSize
      }
    }
  }
}

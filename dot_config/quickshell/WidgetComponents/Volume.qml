import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

import ".."

Rectangle {
  id: root
  color: Theme.background

  property var sink: Pipewire.defaultAudioSink

  readonly property bool ready: sink && sink.ready
  readonly property bool muted: ready && sink.audio.muted
  readonly property int vol: ready ? Math.round(sink.audio.volume * 100) : 0

  readonly property string icon: {
    if (!ready) return String.fromCodePoint(0xF0581)
    if (muted) return ""

    if (vol === 0) return String.fromCodePoint(0xF0581)
    if (vol < 25) return String.fromCodePoint(0xF057F)
    if (vol < 50) return String.fromCodePoint(0xF0580)

    return String.fromCodePoint(0xF057E)
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
      color: Theme.audioColour

      font {
        family: "JetBrainsMono Nerd Font"
        weight: Font.ExtraBold
        pixelSize: Constants.widgetTextPixelSize
      }
    }

    Text {
      text: {
        if (!root.ready) return "_"
        if (root.muted) return "Muted"

        return root.vol + "%"
      }

      color: Theme.audioColour

      font {
        family: "SF Pro Display"
        weight: Font.ExtraBold
        pixelSize: Constants.widgetTextPixelSize
      }
    }
  }

  PwObjectTracker {
    objects: [root.sink]
  }
}

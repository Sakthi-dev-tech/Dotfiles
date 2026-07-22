import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris
import QtQuick
import QtQuick.Layouts

import ".."

RowLayout {
    id: root

    spacing: 10

    anchors {
      verticalCenter: parent.verticalCenter

      left: parent.left
      leftMargin: 10
    }

    readonly property var audioPlayers: Mpris.players.values
    readonly property var currentlyPlayingPlayer: audioPlayers.find(a => a.isPlaying === true)

    readonly property var trackArtUrl: currentlyPlayingPlayer.trackArtUrl

    readonly property var trackTitle: currentlyPlayingPlayer.trackTitle
    readonly property var trackArtist: currentlyPlayingPlayer.trackArtist

    readonly property var currentlyPlayingApp: currentlyPlayingPlayer.desktopEntry // spotify, zen

    ClippingRectangle {
      implicitWidth: 50
      implicitHeight: 50
      radius: 10

        Image {
            id: trackImage
            source: root.trackArtUrl || "https://i.pinimg.com/736x/7f/20/15/7f20156d90bbfa2b7265403413ae0bb6.jpg"
            asynchronous: true

            anchors.fill: parent
        }
    }

    ColumnLayout {
      Layout.maximumWidth: 120
      spacing: 2

      Text {
        Layout.fillWidth: true
        text: root.trackTitle || "No Audio Playing"
        color: "white"
        elide: Text.ElideRight

        font {
          family: "SF Pro Display"
          bold: true
          pixelSize: Constants.widgetTextPixelSize
        }
      }

      Text {
        Layout.fillWidth: true
        text: root.trackArtist || "Unknown"
        color: Theme.onBackgroundText
        elide: Text.ElideRight

        font {
          family: "SF Pro Display"
          pixelSize: Constants.widgetTextPixelSize - 5
        }
      }
    }
}

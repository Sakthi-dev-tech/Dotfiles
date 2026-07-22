import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris

import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import ".."

ClippingRectangle {
    id: root

    radius: 30
    Layout.fillWidth: true
    height: 200

    readonly property var audioPlayers: Mpris.players.values
    readonly property var currentlyPlayingPlayer: audioPlayers.find(a => a.isPlaying === true)

    readonly property var trackArtUrl: currentlyPlayingPlayer?.trackArtUrl
    readonly property var trackTitle: currentlyPlayingPlayer?.trackTitle
    readonly property var trackArtist: currentlyPlayingPlayer?.trackArtist
    readonly property var currentlyPlayingApp: currentlyPlayingPlayer?.desktopEntry // spotify, zen

    Image {
        id: trackArt
        source: root.trackArtUrl || "https://i.pinimg.com/736x/7f/20/15/7f20156d90bbfa2b7265403413ae0bb6.jpg"
        asynchronous: true
        fillMode: Image.PreserveAspectCrop

        anchors.fill: parent
        visible: false
    }

    MultiEffect {
        anchors.fill: parent
        source: trackArt
        blurEnabled: true
        blurMax: 50
        blur: 0.3
    }

    GridLayout {
      rows: 3
      anchors.fill: parent
      anchors {
        leftMargin: 10
      }

      ColumnLayout {
        Text {
          text: root.trackTitle || "No Music Playing"
          color: Theme.white

          font {
            family: "SF Pro Display"
            bold: true
            pixelSize: 26
          }
        }

        Text {
          text: root.trackArtist || "Unknown"
          color: "gray"

          font {
            family: "SF Pro Display"
            pixelSize: 16
          }
        }
      }
    }
}

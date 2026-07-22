import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Mpris

import QtQuick
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

import ".."

ClippingRectangle {
    id: root

    radius: 30
    color: Theme.background
    Layout.fillWidth: true
    Layout.preferredHeight: 200

    readonly property var audioPlayers: Mpris.players.values
    readonly property var player: audioPlayers.find(candidate => candidate.isPlaying) ?? audioPlayers[0] ?? null

    Image {
        id: trackArt
        anchors.fill: parent
        source: root.player?.trackArtUrl ?? ""
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
        visible: false
    }

    MultiEffect {
        anchors.fill: parent
        source: trackArt
        blurEnabled: true
        blurMax: 50
        blur: 0.3
    }

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.75
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16

        ColumnLayout {
            Text {
                Layout.fillWidth: true
                text: root.player?.trackTitle || "No Music Playing"
                color: Theme.white
                elide: Text.ElideRight
                font.family: "SF Pro Display"
                font.bold: true
                font.pixelSize: 26
            }

            Text {
                Layout.fillWidth: true
                text: root.player?.trackArtist || "Unknown"
                color: Theme.onBackgroundText
                opacity: 0.75
                elide: Text.ElideRight
                font.family: "SF Pro Display"
                font.pixelSize: 16
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout {
            Slider {
                Layout.fillWidth: true
                from: 0
                to: Math.max(root.player?.length ?? 0, 1)
                value: root.player?.position ?? 0
                enabled: !!root.player && root.player.canSeek && root.player.lengthSupported
                onMoved: root.player.position = value
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                spacing: 16

                ToolButton {
                    text: "⏮"
                    font.pixelSize: 24
                    palette.buttonText: Theme.white
                    enabled: root.player?.canGoPrevious ?? false
                    Accessible.name: "Previous track"
                    onClicked: root.player.previous()
                }

                ToolButton {
                    text: root.player?.isPlaying ? "⏸" : "▶"
                    font.pixelSize: 24
                    palette.buttonText: Theme.white
                    enabled: root.player?.canTogglePlaying ?? false
                    Accessible.name: root.player?.isPlaying ? "Pause" : "Play"
                    onClicked: root.player.togglePlaying()
                }

                ToolButton {
                    text: "⏭"
                    font.pixelSize: 24
                    palette.buttonText: Theme.white
                    enabled: root.player?.canGoNext ?? false
                    Accessible.name: "Next track"
                    onClicked: root.player.next()
                }
            }
        }
    }
}

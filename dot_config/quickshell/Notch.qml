import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

import "NotchComponents"

Rectangle {
    id: root
    readonly property bool expanded: {
        if (root.showVolumeSlider)
            return false;

        return mouseArea.containsMouse;
    }
    color: Theme.background
    implicitWidth: {
        if (root.showVolumeSlider)
            return 360;

        if (expanded)
            return 550;

        return clock.width + Constants.notchWidthPadding;
    }
    implicitHeight: {
        if (!root.showVolumeSlider && expanded)
            return 75;

        return clock.height + Constants.notchHeightPadding;
    }
    radius: expanded ? 20 : 50

    function clearOtherFlags() {
        root.showVolumeSlider = false;
    }

    AudioPlayback {
        id: audioPlayback
        states: [
            State {
                name: "visible"
                when: root.expanded // Replace with your actual condition
                PropertyChanges {
                    target: audioPlayback
                    opacity: 1
                }
            },
            State {
                name: "hidden"
                when: !root.expanded
                PropertyChanges {
                    target: audioPlayback
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                from: "hidden"
                to: "visible"
                NumberAnimation {
                    property: "opacity"
                    duration: Constants.notchAnimationDuration
                    easing.type: Easing.InExpo
                }
            },
            Transition {
                from: "visible"
                to: "hidden"
                NumberAnimation {
                    property: "opacity"
                    duration: 200
                    easing.type: Easing.OutExpo
                }
            }
        ]
    }

    Clock {
        id: clock

        expanded: root.expanded
        opacity: {
            if (root.showVolumeSlider)
                return 0;

            return 1;
        }

        anchors.centerIn: parent

        Behavior on opacity {
            NumberAnimation {
                duration: Constants.notchAnimationDuration
                easing.type: Easing.OutCubic
            }
        }
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: Constants.notchAnimationDuration
            easing.type: Easing.OutCubic
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: Constants.notchAnimationDuration
            easing.type: Easing.OutCubic
        }
    }

    /*
     * ==========================================================
     * VOLUME CHANGE LOGIC
     * ==========================================================
     */
    property bool showVolumeSlider: false
    property int volumeLevel: 20
    readonly property var defaultSink: Pipewire.defaultAudioSink

    Timer {
        id: hideVolumeSlider
        interval: 2000
        onTriggered: root.showVolumeSlider = false
    }

    function revealVolumeSlider(level) {
        showVolumeSlider = true;
        volumeLevel = level;

        if (volumeSlider.isHovered) {
            hideVolumeSlider.stop();
        } else {
            hideVolumeSlider.restart();
        }
    }

    PwObjectTracker {
        objects: [root.defaultSink]
    }

    Connections {
        target: root.defaultSink?.audio

        function onVolumeChanged() {
            let volume = Math.floor(root.defaultSink.audio.volume * 100);
            root.revealVolumeSlider(volume);
        }

        function onMutedChanged() {
            let volume = Math.round(root.defaultSink.audio.volume * 100);
            let isMuted = root.defaultSink.audio.muted;
            root.revealVolumeSlider(isMuted ? 0 : volume);
        }
    }

    VolumeSlider {
        id: volumeSlider

        shouldRender: root.showVolumeSlider
        level: root.volumeLevel

        onLevelEdited: level => {
            if (!root.defaultSink?.audio)
                return;
            root.volumeLevel = Math.round(level);
            root.defaultSink.audio.volume = level / 100;

            if (level > 0 && root.defaultSink.audio.muted)
                root.defaultSink.audio.muted = false;
        }

        onIsHoveredChanged: {
            if (!root.showVolumeSlider)
                return;

            if (isHovered)
                hideVolumeSlider.stop();
            else
                hideVolumeSlider.restart();
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}

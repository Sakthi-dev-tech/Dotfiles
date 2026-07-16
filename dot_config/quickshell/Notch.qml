import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

import "NotchComponents"

Rectangle {
    id: notch
    readonly property bool expanded: {
      if (notch.showVolumeSlider) return false 

      return mouseArea.containsMouse
    }
    color: Theme.background
    implicitWidth: {
        if (notch.showVolumeSlider)
            return 360;

        if (expanded)
            return 500;

        return clock.width + Constants.widgetWidthPadding + 20;
    }
    implicitHeight: {
        if (!notch.showVolumeSlider && expanded)
            return 100;

        return clock.height + Constants.widgetHeightPadding + 5;
    }
    radius: 60

    Clock {
        id: clock
        opacity: {
            if (notch.showVolumeSlider)
                return 0;

            return 1;
        }
        anchors.verticalCenterOffset: notch.expanded ? -10 : 0

        Behavior on anchors.verticalCenterOffset {
            NumberAnimation {
                duration: 320
                easing.type: Easing.OutCubic
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 320
                easing.type: Easing.OutCubic
            }
        }
    }

    Date {
        clockItem: clock
        notchItem: notch
    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 320
            easing.type: Easing.OutCubic
        }
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 320
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
        onTriggered: notch.showVolumeSlider = false
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
        objects: [notch.defaultSink]
    }

    Connections {
        target: notch.defaultSink?.audio

        function onVolumeChanged() {
            let volume = Math.floor(notch.defaultSink.audio.volume * 100);
            notch.revealVolumeSlider(volume);
        }

        function onMutedChanged() {
            let volume = Math.round(notch.defaultSink.audio.volume * 100);
            let isMuted = notch.defaultSink.audio.muted;
            notch.revealVolumeSlider(isMuted ? 0 : volume);
        }
    }

    VolumeSlider {
        id: volumeSlider

        shouldRender: notch.showVolumeSlider
        level: notch.volumeLevel

        onLevelEdited: level => {
            if (!notch.defaultSink?.audio) return

            notch.volumeLevel = Math.round(level);
            notch.defaultSink.audio.volume = level / 100;

            if (level > 0 && notch.defaultSink.audio.muted)
                notch.defaultSink.audio.muted = false;
        }

        onIsHoveredChanged: {
            if (!notch.showVolumeSlider)
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

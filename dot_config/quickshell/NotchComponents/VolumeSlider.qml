import QtQuick
import QtQuick.Layouts

import ".."

Item {
    id: root
    required property bool shouldRender
    required property int level
    property bool isHovered: sliderMouse.containsMouse

    signal levelEdited(real level)

    visible: opacity > 0
    anchors.fill: parent
    z: 1
    opacity: shouldRender ? 1 : 0

    Behavior on opacity {
        NumberAnimation {
            duration: 180
        }
    }

    Rectangle {
        id: track
        height: parent.height
        width: (root.level / 100) * parent.width
        color: Theme.audioColour
        radius: 30

        Behavior on width {
            NumberAnimation {
                duration: sliderMouse.pressed ? 0 : 200
                easing.type: Easing.OutCubic
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        Text {
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: 18
            text: root.level === 0 ? "󰝟" : "󰕾"
            color: Theme.white
            font {
                family: "JetBrainsMono Nerd Font"
                pixelSize: 20
            }
        }
    }

    MouseArea {
        id: sliderMouse
        anchors.fill: parent
        hoverEnabled: true
        enabled: root.shouldRender

        function editLevel() {
            root.levelEdited(Math.max(0, Math.min(100, mouseX / width * 100)));
        }

        onPressed: editLevel()
        onPositionChanged: if (pressed)
            editLevel()
    }
}

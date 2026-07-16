import Quickshell
import Quickshell.Io
import QtQuick

import ".."

Rectangle {
    color: mouseArea.containsMouse ? "#40ff0000" : "transparent"
    radius: width / 2

    implicitWidth: Constants.widgetWidthPadding
    implicitHeight: Constants.widgetTextPixelSize + Constants.widgetHeightPadding

    Behavior on color {
        ColorAnimation { duration: 120 }
    }

    Text {
        anchors.centerIn: parent
        text: ""
        color: "red"

        font {
            pixelSize: Constants.widgetTextPixelSize
            family: "JetBrainsMono Nerd Font"
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            Quickshell.execDetached(["wlogout"]);
        }
    }
}

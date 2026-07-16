import Quickshell
import QtQuick

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 35
    color: "transparent"

    Item {
      id: topBar
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.topMargin: 5

        Workspaces {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        Notch {
            anchors.centerIn: parent
        }

        Widgets {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}

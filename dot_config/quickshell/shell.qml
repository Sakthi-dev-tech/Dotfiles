import Quickshell
import QtQuick

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 300 // create rendering surface of this height
    exclusiveZone: 35 // bar reserves this height from the top
    color: "transparent"
    mask: Region {
        item: topBar
        Region { item: notch }
    }

    Item {
        id: topBar
        height: 30
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: 10
            topMargin: 5
        }

        Workspaces {
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
        }

        Notch {
            id: notch
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
        }

        Widgets {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}

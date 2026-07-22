import Quickshell
import QtQuick
import QtQuick.Layouts

import "ControlCenterComponents"

Item {
    id: controlCenterUI
    required property bool shouldRender

    anchors.fill: parent
    implicitHeight: mainLayout.implicitHeight

    // Fade in only when toggled
    opacity: shouldRender ? 1 : 0
    visible: opacity > 0

    Behavior on opacity {
        NumberAnimation {
            duration: Constants.notchAnimationDuration
            easing.type: Easing.OutCubic
        }
    }

    ColumnLayout {
        id: mainLayout
        spacing: 15

        anchors {
            top: parent.top
            topMargin: 10

            left: parent.left
            leftMargin: 20

            right: parent.right
            rightMargin: 20
        }

        Text {
            id: controlCenterText
            text: "Control Center"
            color: Theme.white

            font {
                family: "SF Pro Display"
                bold: true
                pixelSize: 20
            }
        }

        Item {
          implicitHeight: 10
        }

        GridLayout {
            columns: 2

            WifiQuickSetting {}

            BluetoothQuickSetting {}
        }

        MusicPlayer {}
    }
}

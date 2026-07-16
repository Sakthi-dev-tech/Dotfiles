import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Rectangle {
  id: root

  color: Theme.background
  radius: Constants.radiusForElems

  property color activeColour: Theme.workspaceActive
  property color inactiveColour: Theme.background

  implicitWidth: workspaces.implicitWidth
  implicitHeight: workspaces.implicitHeight

  RowLayout {
    id: workspaces

    spacing: 2
    
    anchors.centerIn: parent

    Repeater {
      model: 9

      Rectangle {
        id: workspaceButton

        property int wsId: index + 1
        property var ws: Hyprland.workspaces.values.find(w => w.id === wsId)
        property bool isOccupied: ws !== undefined && ws !== null && ws.toplevels.values.length > 0
        property bool isActive: Hyprland.focusedWorkspace?.id === wsId
        property bool shouldRender: isOccupied || isActive

        visible: shouldRender

        Layout.alignment: Qt.AlignVCenter

        implicitWidth: isActive ? Constants.activeWorkspaceWidth
                        : shouldRender ? Constants.inactiveWorkspaceWidth
                        : 0
        implicitHeight: shouldRender ? Constants.workspaceHeight : 0
        radius: Constants.radiusForElems

        color: isActive
          ? root.activeColour
          : shouldRender
          ? root.inactiveColour
          : "transparent"

        Behavior on implicitWidth {
          NumberAnimation {
            duration: 160
            easing.type: Easing.OutCubic
          }
        }

        Behavior on color {
          ColorAnimation {
            duration: 120
          }
        }


        Text {
          anchors.centerIn: parent
          text: workspaceButton.wsId
          color: workspaceButton.isActive ? Theme.activeWorkspaceNumColour
          : workspaceButton.isOccupied
          ? "white"
          : "transparent"

          font.pixelSize: 11
          font.bold: workspaceButton.isActive
          font {
            family: "SF Pro Display"
          }
        }
      }
    }
  }
}

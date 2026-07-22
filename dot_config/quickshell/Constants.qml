pragma Singleton
import QtQuick

QtObject {
  // General
  readonly property int radiusForElems: 20

  //Workspaces
  readonly property int activeWorkspaceWidth: 50
  readonly property int inactiveWorkspaceWidth: 24

  readonly property int workspaceHeight: 26

  // Widgets
  readonly property int widgetWidthPadding: 25
  readonly property int widgetHeightPadding: 10
  readonly property int widgetTextPixelSize: 14

  // Notch
  readonly property int notchWidthPadding: 45
  readonly property int notchHeightPadding: 15

  readonly property int notchAnimationDuration: 320
}


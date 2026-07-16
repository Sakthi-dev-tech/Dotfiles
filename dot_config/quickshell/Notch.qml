import Quickshell
import QtQuick
import QtQuick.Layouts

import "NotchComponents"

Rectangle {
  color: Theme.background
  implicitWidth: clock.width + Constants.widgetWidthPadding
  implicitHeight: clock.height + Constants.widgetHeightPadding
  radius: Constants.radiusForElems

  Clock {
    id: clock
  }
}

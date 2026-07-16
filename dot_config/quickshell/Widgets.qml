import QtQuick
import QtQuick.Layouts

import "WidgetComponents"

RowLayout {
    spacing: 8
    Layout.alignment: Qt.AlignRight

    Network {}
    Bluetooth {}
    Volume {}
    Battery {}

    PowerButton {}
}

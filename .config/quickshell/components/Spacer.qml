import QtQuick
import QtQuick.Layouts

Item {
    id: spacer

    property bool fill
    property int spacing

    Layout.fillWidth: fill

    Layout.leftMargin: spacing
}

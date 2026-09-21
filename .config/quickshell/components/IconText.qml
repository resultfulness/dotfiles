import QtQuick

import qs.style

Item {
    implicitWidth: icon.width
    implicitHeight: icon.width

    required property string text

    Text {
        id: icon

        anchors.centerIn: parent
        text: parent.text
        font.family: Fonts.fontIcon
        font.pointSize: Fonts.fontIconSize
        color: Color.foreground
    }
}

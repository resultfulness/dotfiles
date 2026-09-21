import QtQuick
import Quickshell.Widgets

import qs.style
import qs.services

WrapperMouseArea {
    child: volume

    cursorShape: Qt.PointingHandCursor
    onWheel: e => {
        if (e.angleDelta.y < 0) {
            Audio.volumedown();
        }
        if (e.angleDelta.y > 0) {
            Audio.volumeup();
        }
    }
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: e => {
        if (e.button & Qt.LeftButton) {
            Audio.cyclesinks();
        }
        if (e.button & Qt.RightButton) {
            Audio.toggleSinkMute();
        }
    }

    WrapperRectangle {
        id: volume
        color: "transparent"

        StyledText {
            id: volume_label

            text: `${Audio.sinkVolume} @ ${Audio.sinkName}`
            color: !Audio.sinkMuted ? Color.foreground : Color.muted
            font.strikeout: Audio.sinkMuted
        }
    }
}

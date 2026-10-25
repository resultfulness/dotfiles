import QtQuick
import Quickshell.Widgets

import qs.services

WrapperMouseArea {
    acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
    onClicked: e => {
        if (e.button & Qt.LeftButton) {
            Pomodoro.toggle();
        }
        if (e.button & Qt.RightButton) {
            Pomodoro.reset();
        }
        if (e.button & Qt.MiddleButton) {
            Pomodoro.skip();
        }
    }
    cursorShape: Qt.PointingHandCursor

    StyledText {
        property string t: Pomodoro.get_time()

        text: "t=" + t + (t === "off" ? "" : ` (${Pomodoro.get_state()})`)
    }
}

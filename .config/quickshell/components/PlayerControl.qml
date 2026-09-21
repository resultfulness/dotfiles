import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.services

Loader {
    active: Mpris.player !== null
    onLoaded: () => console.log(JSON.stringify(Mpris.player))

    sourceComponent: WrapperMouseArea {
        child: player

        cursorShape: Qt.PointingHandCursor

        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: e => {
            if (e.button & Qt.LeftButton) {
                Mpris.toggle_pause();
            }
        }

        onWheel: e => {
            if (e.angleDelta.y < 0) {
                Mpris.prev_player();
            }
            if (e.angleDelta.y > 0) {
                Mpris.next_player();
            }
        }

        WrapperRectangle {
            id: player
            color: "transparent"

            StyledText {
                id: player_label

                text: Mpris.get_text()
            }
        }
    }
}

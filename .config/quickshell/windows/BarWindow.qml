import Quickshell
import Quickshell.Widgets
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

import qs.components
import qs.style

PanelWindow {
    id: bar
    color: "transparent"

    required property ShellScreen screen

    anchors {
        left: true
        top: true
        right: true
    }

    implicitHeight: box.height

    WlrLayershell.exclusionMode: ExclusionMode.Auto
    // WlrLayershell.exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Top

    WrapperRectangle {
        id: box
        color: Color.background
        anchors.left: parent.left
        anchors.right: parent.right

        topMargin: 4
        leftMargin: 4
        rightMargin: 16
        bottomMargin: 4

        RowLayout {
            id: bar_layout
            spacing: 0

            RowLayout {
                spacing: 16
                Workspaces {}
                KeyboardLayout {}
            }

            Spacer {
                fill: true
            }

            RowLayout {
                spacing: 16
                PlayerControl {}
                Tray {}
                Volume {}
            }
        }
    }

    Clock {
        anchors.centerIn: parent
    }
}

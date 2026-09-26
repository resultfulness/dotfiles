pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Widgets

import qs.style

WrapperMouseArea {
    onWheel: e => {
        const mod = e.angleDelta.y < 0 ? "+" : "-";
        Hyprland.dispatch(`hl.dsp.focus({ workspace = "e${mod}1" })`);
    }

    RowLayout {
        spacing: 4

        Repeater {
            model: Hyprland.workspaces

            WrapperMouseArea {
                id: box

                required property int index
                required property HyprlandWorkspace modelData
                readonly property HyprlandWorkspace workspace: modelData

                onPressed: workspace.activate()
                cursorShape: Qt.PointingHandCursor

                Behavior on Layout.preferredWidth {
                    NumberAnimation {
                        duration: 200
                        easing.type: Easing.OutExpo
                    }
                }

                readonly property int spacing: 8
                readonly property int margin: 8
                readonly property int unfocusedWidth: workspace_id.width + margin * 2
                readonly property int focusedWidth: workspace_id.width + workspace_label.width + spacing + margin * 2

                Layout.preferredWidth: workspace.focused ? focusedWidth : unfocusedWidth

                ClippingWrapperRectangle {
                    color: box.workspace.focused ? Color.magenta : Color.muted
                    margin: 2
                    radius: 4
                    leftMargin: box.margin
                    rightMargin: box.margin

                    RowLayout {
                        spacing: box.spacing

                        StyledText {
                            id: workspace_id
                            text: box.workspace.id
                            color: box.workspace.focused ? Color.muted : Color.foreground
                            font.weight: box.workspace.focused ? 600 : 400
                        }
                        StyledText {
                            id: workspace_label
                            text: box.workspace.name
                            color: box.workspace.focused ? Color.muted : Color.foreground
                            font.weight: box.workspace.focused ? 600 : 400
                        }
                    }
                }
            }
        }
    }
}

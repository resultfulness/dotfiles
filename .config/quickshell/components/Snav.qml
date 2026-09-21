pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

import qs.style
import qs.services

WrapperRectangle {
    id: root

    color: Color.background
    margin: 16
    radius: 4
    readonly property int pointSize: 14

    border {
        color: Color.border
        width: 4
    }

    readonly property var binds: Submaps.get_binds()
    readonly property var name: Submaps.get_name()

    ColumnLayout {
        id: main_layout

        spacing: 8

        StyledText {
            id: title
            text: "+" + root.name
            Layout.alignment: Qt.AlignHCenter
            visible: root.name !== "main"

            font.pointSize: root.pointSize
        }

        GridLayout {
            id: binds_list

            rows: root.binds.length
            flow: GridLayout.TopToBottom
            columnSpacing: 12
            rowSpacing: 0

            Repeater {
                id: bind_key_icon
                model: root.binds

                StyledText {
                    id: bind_key_label
                    required property var modelData
                    text: modelData.key
                    font.pointSize: root.pointSize

                    Layout.alignment: Qt.AlignRight
                }
            }

            Repeater {
                id: bind_arrow
                model: root.binds

                IconText {
                    text: "➜"
                }
            }

            Repeater {
                id: bind_detail
                model: root.binds

                StyledText {
                    id: bind_description
                    required property var modelData
                    text: modelData.description
                    font.pointSize: root.pointSize

                    color: modelData.description.startsWith("+") ? Color.yellow : Color.foreground
                }
            }
        }
    }
}

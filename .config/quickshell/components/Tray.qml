import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets

RowLayout {
    id: tray
    spacing: 2

    Repeater {
        id: tray_items
        model: SystemTray.items

        WrapperMouseArea {
            id: tray_item

            acceptedButtons: Qt.RightButton
            onClicked: tray_menu.open()

            required property SystemTrayItem modelData

            IconImage {
                id: tray_icon
                source: tray_item.modelData.icon
                implicitSize: 20
            }

            QsMenuAnchor {
                id: tray_menu
                anchor {
                    item: tray_icon
                    margins {
                        top: 16
                        left: 8
                    }
                }
                menu: tray_item.modelData.menu
            }
        }
    }
}

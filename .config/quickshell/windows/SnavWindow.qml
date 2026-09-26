import Quickshell
import Quickshell.Wayland

import qs.components
import qs.services

PanelWindow {
    id: snav
    color: "transparent"

    WlrLayershell.exclusionMode: ExclusionMode.Normal
    WlrLayershell.layer: WlrLayer.Overlay
    WlrLayershell.namespace: "snav"

    anchors.top: true
    margins.top: 32

    implicitWidth: snav_box.width
    implicitHeight: snav_box.height

    visible: Submaps.get_name() !== "reset"

    Snav {
        id: snav_box
    }
}

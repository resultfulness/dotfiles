pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

import qs

Singleton {
    id: root

    readonly property UPowerDevice battery: UPower.displayDevice
    readonly property string percentage: battery.percentage.toFixed(2)
    readonly property bool is_charging: battery.state === UPowerDeviceState.Charging

    function get_time_remaining() {
        return Utils.seconds_to_hhmmss_display(
            is_charging ? battery.timeToFull : battery.timeToEmpty
        );
    }
}

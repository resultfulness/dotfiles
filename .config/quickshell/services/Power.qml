pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
    id: root

    readonly property UPowerDevice battery: UPower.displayDevice
    readonly property string percentage: battery.percentage.toFixed(2)
    readonly property bool is_charging: battery.state === UPowerDeviceState.Charging

    function get_time_remaining() {
        return seconds_to_hhmmss_display(
            is_charging ? battery.timeToFull : battery.timeToEmpty
        );
    }

    function seconds_to_hhmmss_display(seconds: int): string {
        const date_str = new Date(seconds * 1000).toISOString();
        if (seconds < 3600) {
            return date_str.substring(14, 19);
        }
        return date_str.substring(11, 19);
    }
}

pragma Singleton

import Quickshell
import QtQuick

Singleton {
    readonly property string time: Qt.formatDateTime(clock.date, "hh:mm:ss")
    readonly property string date: Qt.formatDateTime(clock.date, "dddd, d")

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}

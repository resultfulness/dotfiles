import Quickshell
import qs.services

LazyLoader {
    active: Power.battery.ready
    StyledText {
        readonly property string charge_indicator: Power.is_charging ? "+" : ""
        readonly property string time: Power.get_time_remaining()

        text: "bat=" + Power.percentage + charge_indicator + " " + `(${time})`
    }
}

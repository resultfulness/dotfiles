import qs.services

StyledText {
    visible: Power.battery.ready

    readonly property string charge_indicator: Power.is_charging ? "+" : ""
    readonly property string time: Power.get_time_remaining()

    text: "bat=" + Power.percentage + charge_indicator + " " + `(${time})`
}

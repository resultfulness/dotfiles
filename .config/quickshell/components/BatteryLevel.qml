import qs.services

StyledText {
    text: "bat="
        + Power.battery.percentage
        + (Power.is_charging ? "+" : "")
        + " " + `(${Power.get_time_remaining()})`
}

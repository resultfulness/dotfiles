pragma Singleton

import QtQuick
import Quickshell

import qs

Singleton {
    id: root

    Timer {
        id: timer
        running: false
        repeat: true
        interval: 1000

        onTriggered: root.t = root.t - 1
    }

    enum PomodoroState {
        Productivity,
        Rest
    }

    readonly property int productivity_time: 50 * 60
    readonly property int rest_time: 20 * 60

    property int state: Pomodoro.Productivity
    property int t: productivity_time

    onTChanged: if (t <= 0) {
        if (state === Pomodoro.Productivity) {
            state = Pomodoro.Rest;
            t = rest_time;
            Quickshell.execDetached(["sh", "-c", "notify-send 'time to rest' -t 10000"]);
        } else {
            state = Pomodoro.Productivity;
            t = productivity_time;
            Quickshell.execDetached(["sh", "-c", "notify-send 'time to work' -t 10000"]);
        }
    }

    function get_time() {
        if (!timer.running && t === productivity_time) {
            return "off";
        }
        return Utils.seconds_to_hhmmss_display(t);
    }

    function get_state() {
        switch (state) {
        case Pomodoro.Productivity:
            return "p";
        case Pomodoro.Rest:
            return "r";
        }
    }

    function toggle() {
        if (timer.running) {
            timer.stop();
        } else {
            timer.start();
        }
    }

    function reset() {
        timer.stop();
        state = Pomodoro.Productivity;
        t = productivity_time;
    }

    function skip() {
        if (timer.running) {
            t = 0;
        }
    }
}

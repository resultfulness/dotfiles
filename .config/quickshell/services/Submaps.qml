pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    function get_name() {
        return listener.active?.submap ?? "reset";
    }

    function get_binds() {
        return listener.active?.binds?.map(bind => ({
                    key: modmask_to_str(bind.modmask) + bind.key,
                    description: bind.description
                })) ?? [];
    }

    readonly property int shift: 1 << 0
    readonly property int lock: 1 << 1
    readonly property int control: 1 << 2
    readonly property int mod: 1 << 6

    function modmask_to_str(modmask: int): string {
        let out = "";
        if (modmask & shift)
            out += "shift + ";
        if (modmask & lock)
            out += "lock + ";
        if (modmask & control)
            out += "control + ";
        if (modmask & mod)
            out += "mod + ";

        return out;
    }

    Process {
        id: listener
        property var active
        running: true
        command: [`${Quickshell.shellDir}/scripts/listen-active-submap`]
        stdout: SplitParser {
            onRead: d => listener.active = JSON.parse(d)
        }
    }
}

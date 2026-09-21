pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    function get_current_layout() {
        return listener.layout ?? "";
    }

    Process {
        id: listener
        property var layout
        running: true
        command: [`${Quickshell.shellDir}/scripts/listen-active-layout`]
        stdout: SplitParser {
            onRead: d => listener.layout = d
        }
    }
}

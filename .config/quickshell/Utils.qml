pragma Singleton

import Quickshell

Singleton {
    function seconds_to_hhmmss_display(seconds: int): string {
        const date_str = new Date(seconds * 1000).toISOString();
        if (seconds < 3600) {
            return date_str.substring(14, 19);
        }
        return date_str.substring(11, 19);
    }
}

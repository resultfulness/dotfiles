pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property int ellipsis: 50
    readonly property string ellipsis_chars: "..."

    property MprisPlayer player: Mpris.players.values[0] ?? null

    readonly property string icon: player?.isPlaying ? "" : ""

    readonly property list<MprisPlayer> players: Mpris.players.values

    function get_text() {
        let playerName = player.identity;
        if (!player.trackArtist) {
            return playerName;
        }

        let out = `${playerName}: ${icon} ${player.trackArtist} - ${player.trackTitle}`;

        return out.length > ellipsis ? out.slice(0, ellipsis - ellipsis_chars.length) + ellipsis_chars : out;
    }

    function next_player() {
        let nextid = players.findIndex(({
                uniqueId
            }) => uniqueId === player.uniqueId) + 1;
        if (nextid >= players.length) {
            nextid = 0;
        }
        player = players[nextid];
    }

    function prev_player() {
        let previd = players.findIndex(({
                uniqueId
            }) => uniqueId === player.uniqueId) - 1;
        if (previd < 0) {
            previd = players.length - 1;
        }
        player = players[previd];
    }

    function toggle_pause() {
        if (player.canTogglePlaying) {
            player.togglePlaying();
        }
    }
}

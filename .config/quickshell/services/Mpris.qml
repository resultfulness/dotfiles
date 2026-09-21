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

// {
//     "objectName": "",
//     "canControl": true,
//     "canPlay": true,
//     "canPause": true,
//     "canTogglePlaying": true,
//     "canSeek": true,
//     "canGoNext": true,
//     "canGoPrevious": true,
//     "canQuit": false,
//     "canRaise": true,
//     "canSetFullscreen": false,
//     "identity": "cmus",
//     "desktopEntry": "",
//     "dbusName": "org.mpris.MediaPlayer2.cmus",
//     "position": 0,
//     "positionSupported": true,
//     "length": 90,
//     "lengthSupported": true,
//     "volume": 0.5,
//     "volumeSupported": true,
//     "metadata": {
//       "mpris:length": 90000000,
//       "mpris:trackid": "",
//       "xesam:album": "Ikenfell (Original Game Soundtrack)",
//       "xesam:albumArtist": [
//         "aivi & surasshu"
//       ],
//       "xesam:artist": [
//         "aivi & surasshu"
//       ],
//       "xesam:comment": [
//         "Visit https://aivisura.bandcamp.com"
//       ],
//       "xesam:title": "Lullaby for a Witch - Title Screen",
//       "xesam:trackNumber": 1
//     },
//     "uniqueId": 1,
//     "trackTitle": "Lullaby for a Witch - Title Screen",
//     "trackArtist": "aivi & surasshu",
//     "trackArtists": "aivi & surasshu",
//     "trackAlbum": "Ikenfell (Original Game Soundtrack)",
//     "trackAlbumArtist": "aivi & surasshu",
//     "trackArtUrl": "",
//     "playbackState": 2,
//     "isPlaying": false,
//     "loopState": 0,
//     "loopSupported": true,
//     "rate": 1,
//     "minRate": 1,
//     "maxRate": 1,
//     "shuffle": false,
//     "shuffleSupported": true,
//     "fullscreen": false,
//     "supportedUriSchemes": [
//       "file",
//       "http"
//     ],
//     "supportedMimeTypes": []
//   }

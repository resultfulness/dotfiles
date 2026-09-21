pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    readonly property real changeamt: 0.05

    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property bool sinkMuted: sink?.audio?.muted ?? false
    readonly property string sinkVolume: sink?.audio?.volume.toFixed(2) ?? "0.00"
    readonly property string sinkName: sink?.nickname || sink?.name || "unnamed"

    readonly property var output_hw_filter: n => n.isSink && !n.isStream && n.name !== "alsa_output.pci-0000_0d_00.4.iec958-stereo"
    readonly property list<PwNode> sinks: Pipewire.nodes.values.filter(output_hw_filter)

    onSinkMutedChanged: () => console.log(JSON.stringify(sinks))

    readonly property list<int> sinkids: sinks.map(n => n.id)

    readonly property PwNode source: Pipewire.defaultAudioSource
    readonly property bool sourceMuted: source?.audio?.muted ?? false
    readonly property string sourceVolume: sink?.audio?.volume.toFixed(2) ?? "0.00"

    function volumeup() {
        if (sink?.ready && sink?.audio) {
            sink.audio.volume = Math.min(sink.audio.volume + changeamt, 1);
        }
    }

    function volumedown() {
        if (sink?.ready && sink?.audio) {
            sink.audio.volume = Math.max(sink.audio.volume - changeamt, 0);
        }
    }

    function toggleSinkMute() {
        if (sink?.ready && sink?.audio) {
            sink.audio.muted = !sink.audio.muted;
        }
    }

    function cyclesinks() {
        let nextid = sinkids.findIndex(id => id === sink.id) + 1;
        if (nextid >= sinkids.length) {
            nextid = 0;
        }
        Pipewire.preferredDefaultAudioSink = sinks[nextid];
    }

    PwObjectTracker {
        objects: [...root.sinks, Pipewire.defaultAudioSource]
    }
}

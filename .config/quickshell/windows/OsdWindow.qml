import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets

import qs.components
import qs.style
import qs.services

Item {
    id: root
    property bool show: false

    Timer {
        id: timer
        interval: 1000
        onTriggered: root.show = false
    }

    Component.onCompleted: {
        Audio.audioChanged.connect(() => {
            root.show = true;
            timer.restart();
        });
    }

    LazyLoader {
        active: root.show

        PanelWindow {
            id: osd
            color: "transparent"

            implicitWidth: box.width
            implicitHeight: box.height

            mask: Region {}

            WrapperRectangle {
                id: box
                anchors.fill: parent
                radius: 4
                color: Color.background

                margin: 8

                ColumnLayout {
                    spacing: 8
                    StyledText {
                        text: Audio.sinkName
                        color: !Audio.sinkMuted ? Color.foreground : Color.muted
                        font.strikeout: Audio.sinkMuted
                    }

                    Item {
                        Layout.fillWidth: true
                        implicitWidth: 400
                        implicitHeight: 30

                        Rectangle {
                            anchors {
                                left: parent.left
                                top: parent.top
                                bottom: parent.bottom
                            }
                            radius: 4
                            color: !Audio.sinkMuted ? Color.foreground : Color.muted

                            implicitWidth: parent.width * Audio.sinkVolume

                            Behavior on implicitWidth {
                                NumberAnimation {
                                    duration: 200
                                    easing.type: Easing.OutExpo
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

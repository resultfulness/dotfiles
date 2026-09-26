//@ pragma UseQApplication

import QtQuick
import Quickshell

import qs.windows

ShellRoot {
    id: root

    Variants {
        model: Quickshell.screens

        Scope {
            id: scope
            required property ShellScreen modelData

            BarWindow {
                screen: scope.modelData
            }

            SnavWindow {}
            OsdWindow {}
        }
    }
}

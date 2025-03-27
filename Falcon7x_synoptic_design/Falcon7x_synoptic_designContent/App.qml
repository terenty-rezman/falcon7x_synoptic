// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import Falcon7x_synoptic_design

Window {
    width: mainScreen.width
    height: mainScreen.height

    visible: true
    title: "Falcon7x_synoptic_design"

    ElecTab {
        id: mainScreen

        Text {
            id: start_under_APU
            x: 117
            y: 248
            width: 50
            height: 23
            color: "#21da1b"
            text: qsTr("START")
            font.pixelSize: 15
            font.family: "Arial"
        }

        Text {
            id: ready_under_APU
            x: 115
            y: 277
            width: 55
            height: 17
            color: "#21da1b"
            text: qsTr("READY")
            font.pixelSize: 15
            font.family: "Arial"
        }
    }

}


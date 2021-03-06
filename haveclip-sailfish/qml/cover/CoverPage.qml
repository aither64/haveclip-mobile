/*
  HaveClip

  Copyright (C) 2013-2016 Jakub Skokan <aither@havefun.cz>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Image {
        anchors.horizontalCenter: parent.horizontalCenter
        source: "/usr/share/icons/hicolor/86x86/apps/harbour-haveclip.png"
        y: parent.height / 10
    }

    Label {
        text: manager.content.trim().slice(0, 15)
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.verticalCenter
        }
        font.pixelSize: Theme.fontSizeExtraSmall
    }

    CoverActionList {
        enabled: settings.syncEnabled

        CoverAction {
            iconSource: "image://theme/icon-cover-refresh"
            onTriggered: manager.doSync()
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-pause"
            onTriggered: settings.syncEnabled = false
        }
    }

    CoverActionList {
        enabled: !settings.syncEnabled

        CoverAction {
            iconSource: "image://theme/icon-cover-refresh"
            onTriggered: manager.doSync()
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-play"
            onTriggered: settings.syncEnabled = true
        }
    }
}



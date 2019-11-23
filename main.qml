/* main.qml
*
* 	Copyright (C) 2018-2019 Christian Visintin - christian.visintin1997@gmail.com
*
* 	This file is part of "FlapQML"
*
*   FlapQML is free software: you can redistribute it and/or modify
*   it under the terms of the GNU General Public License as published by
*   the Free Software Foundation, either version 3 of the License, or
*   (at your option) any later version.
*
*   FlapQML is distributed in the hope that it will be useful,
*   but WITHOUT ANY WARRANTY; without even the implied warranty of
*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*   GNU General Public License for more details.
*
*   You should have received a copy of the GNU General Public License
*   along with FlapQML.  If not, see <http://www.gnu.org/licenses/>.
*
*/

import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

import "./examples" as Examples;

Window {
  visible: true
  width: 1280;
  height: 768;
  title: qsTr("FlapQML");
  id: root;
  color: "black";

  Item {
    width: parent.width;
    height: 48;
    x: 0;
    y: 0;
    Button {
      x: 16;
      y: 8;
      height: 32;
      width: 128;
      text: "Flapboard"
      onClicked: {
        flapboardContainer.visible = true;
        clockContainer.visible = false;
      }
    }
    Button {
      x: 160;
      y: 8;
      height: 32;
      width: 128;
      text: "Clock"
      onClicked: {
        flapboardContainer.visible = false;
        clockContainer.visible = true;
      }
    }
  }

  Item {
    id: mainwindow;
    width: 1280;
    height: 720;
    x: 0;
    y: 48;
    Examples.Flapboard {
      id: flapboardContainer;
      visible: false;
    }
    Examples.Clock {
      id: clockContainer;
      visible: false;
    }
  }


}

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

Window {
  visible: true
  width: 1280;
  height: 720;
  title: qsTr("FlapQML");
  property string charSequence: " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ#!.:";
  property int currPtr: 0;

  property int animDuration: 120;
  color: "#0c0c0c"

  property var flapboard: [flap1, flap2, flap3, flap4, flap5, flap6, flap7, flap8, flap9, flap10, flap11, flap12, flap13, flap14, flap15, flap16, flap17, flap18, flap19, flap20, flap21, flap22, flap23, flap24];

  Grid {
    anchors.centerIn: parent;
    rows: 3;
    spacing: 8;
    Row {
      spacing: 8;
      Flap {
        id: flap1;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#c8102e";
        midColor: "#b52121";
        darkColor: "#a31d1d";
      }
      Flap {
        id: flap2;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#ff8200";
        midColor: "#db7100";
        darkColor: "#c26400";
      }
      Flap {
        id: flap3;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#fce300";
        midColor: "#d9c300";
        darkColor: "#c9b500";
      }
      Flap {
        id: flap4;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#f8a3bc";
        midColor: "#de90a7";
        darkColor: "#cc8398";
      }
      Flap {
        id: flap5;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#0072ce";
        midColor: "#0064b5";
        darkColor: "#00569c";
      }
      Flap {
        id: flap6;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#68c24a";
        midColor: "#5aa840";
        darkColor: "#4f9438";
      }
      Flap {
        id: flap7;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#84754e";
        midColor: "#736544";
        darkColor: "#615539";
      }
      Flap {
        id: flap8;
        flapAnimDuration: animDuration;
        flapText: " "
      }
    }
    Row {
      spacing: 8;
      Flap {
        id: flap9;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#c8102e";
        midColor: "#b52121";
        darkColor: "#a31d1d";
      }
      Flap {
        id: flap10;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#ff8200";
        midColor: "#db7100";
        darkColor: "#c26400";
      }
      Flap {
        id: flap11;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#fce300";
        midColor: "#d9c300";
        darkColor: "#c9b500";
      }
      Flap {
        id: flap12;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#f8a3bc";
        midColor: "#de90a7";
        darkColor: "#cc8398";
      }
      Flap {
        id: flap13;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#0072ce";
        midColor: "#0064b5";
        darkColor: "#00569c";
      }
      Flap {
        id: flap14;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#68c24a";
        midColor: "#5aa840";
        darkColor: "#4f9438";
      }
      Flap {
        id: flap15;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#84754e";
        midColor: "#736544";
        darkColor: "#615539";
      }
      Flap {
        id: flap16;
        flapAnimDuration: animDuration;
        flapText: " "
      }
    }
    Row {
      spacing: 8;
      Flap {
        id: flap17;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#c8102e";
        midColor: "#b52121";
        darkColor: "#a31d1d";
      }
      Flap {
        id: flap18;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#ff8200";
        midColor: "#db7100";
        darkColor: "#c26400";
      }
      Flap {
        id: flap19;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#fce300";
        midColor: "#d9c300";
        darkColor: "#c9b500";
      }
      Flap {
        id: flap20;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#f8a3bc";
        midColor: "#de90a7";
        darkColor: "#cc8398";
      }
      Flap {
        id: flap21;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#0072ce";
        midColor: "#0064b5";
        darkColor: "#00569c";
      }
      Flap {
        id: flap22;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#68c24a";
        midColor: "#5aa840";
        darkColor: "#4f9438";
      }
      Flap {
        id: flap23;
        flapAnimDuration: animDuration;
        flapText: " "
        brightColor: "#84754e";
        midColor: "#736544";
        darkColor: "#615539";
      }
      Flap {
        id: flap24;
        flapAnimDuration: animDuration;
        flapText: " "
      }
    }
  }

  Rectangle {
    x: 0;
    y: 670;
    width: parent.width;
    height: 48;
    color: "#0c0c0c";
    Button {
      id: button;
      x: parent.width / 4;
      width: 128;
      height: 32;
      onClicked: {
        var characters = flaptext.text.split("");
        for (var i = 0; i < flapboard.length && i < characters.length; i++) {
          var flapchar = characters[i];
          flapboard[i].flip(charSequence, flapchar, false);
        }
      }
      text: "Flip";
    }
    Rectangle {
      color: "white";
      width: 480;
      x: parent.width / 2;
      height: 48;
      border.width: 5;
      border.color: "black";
      radius: 5;
      TextInput {
        id: flaptext;
        anchors.fill: parent;
        anchors.centerIn: parent;
        height: 32;
        font.pixelSize: 36;
        horizontalAlignment: Text.AlignHCenter;
      }
    }


  }



}

import QtQuick 2.0
import QtQuick.Controls 1.4

import "../" as Main;

Rectangle {
  id: flapboardBox;
  property string flapSequence: " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ#!.:";
  property int currPtr: 0;

  width: parent.width;
  height: 720;

  property int animDuration: 120;
  color: "#0c0c0c"

  property var flapboard: [flap1, flap2, flap3, flap4, flap5, flap6, flap7, flap8, flap9, flap10, flap11, flap12, flap13, flap14, flap15, flap16, flap17, flap18, flap19, flap20, flap21, flap22, flap23, flap24];

  Grid {
    anchors.centerIn: parent;
    rows: 3;
    spacing: 8;
    Row {
      spacing: 8;
      Main.Flap {
        id: flap1;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#c8102e";
        midColor: "#b52121";
        darkColor: "#a31d1d";
      }
      Main.Flap {
        id: flap2;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#ff8200";
        midColor: "#db7100";
        darkColor: "#c26400";
      }
      Main.Flap {
        id: flap3;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#fce300";
        midColor: "#d9c300";
        darkColor: "#c9b500";
      }
      Main.Flap {
        id: flap4;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#f8a3bc";
        midColor: "#de90a7";
        darkColor: "#cc8398";
      }
      Main.Flap {
        id: flap5;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#0072ce";
        midColor: "#0064b5";
        darkColor: "#00569c";
      }
      Main.Flap {
        id: flap6;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#68c24a";
        midColor: "#5aa840";
        darkColor: "#4f9438";
      }
      Main.Flap {
        id: flap7;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#84754e";
        midColor: "#736544";
        darkColor: "#615539";
      }
      Main.Flap {
        id: flap8;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Top;
        flapFontSize: 96;
        flapText: " "
      }
    }
    Row {
      spacing: 8;
      Main.Flap {
        id: flap9;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#c8102e";
        midColor: "#b52121";
        darkColor: "#a31d1d";
      }
      Main.Flap {
        id: flap10;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#ff8200";
        midColor: "#db7100";
        darkColor: "#c26400";
      }
      Main.Flap {
        id: flap11;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#fce300";
        midColor: "#d9c300";
        darkColor: "#c9b500";
      }
      Main.Flap {
        id: flap12;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#f8a3bc";
        midColor: "#de90a7";
        darkColor: "#cc8398";
      }
      Main.Flap {
        id: flap13;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#0072ce";
        midColor: "#0064b5";
        darkColor: "#00569c";
      }
      Main.Flap {
        id: flap14;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#68c24a";
        midColor: "#5aa840";
        darkColor: "#4f9438";
      }
      Main.Flap {
        id: flap15;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
        brightColor: "#84754e";
        midColor: "#736544";
        darkColor: "#615539";
      }
      Main.Flap {
        id: flap16;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapText: " "
      }
    }
    Row {
      spacing: 8;
      Main.Flap {
        id: flap17;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#c8102e";
        midColor: "#b52121";
        darkColor: "#a31d1d";
      }
      Main.Flap {
        id: flap18;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#ff8200";
        midColor: "#db7100";
        darkColor: "#c26400";
      }
      Main.Flap {
        id: flap19;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#fce300";
        midColor: "#d9c300";
        darkColor: "#c9b500";
      }
      Main.Flap {
        id: flap20;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#f8a3bc";
        midColor: "#de90a7";
        darkColor: "#cc8398";
      }
      Main.Flap {
        id: flap21;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#0072ce";
        midColor: "#0064b5";
        darkColor: "#00569c";
      }
      Main.Flap {
        id: flap22;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#68c24a";
        midColor: "#5aa840";
        darkColor: "#4f9438";
      }
      Main.Flap {
        id: flap23;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
        flapText: " "
        brightColor: "#84754e";
        midColor: "#736544";
        darkColor: "#615539";
      }
      Main.Flap {
        id: flap24;
        flapAnimDuration: animDuration;
        flapSequence: flapboardBox.flapSequence;
        flapTextPosition: textPosition_Bottom;
        flapFontSize: 96;
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
      x: 100;
      width: 128;
      height: 32;
      onClicked: {
        var characters = flaptext.text.split("");
        for (var i = 0; i < flapboard.length && i < characters.length; i++) {
          var flapchar = characters[i];
          flapboard[i].flip(flapchar, false);
        }
      }
      text: "Flip";
    }
    Button {
      id: button2;
      x: 300;
      width: 128;
      height: 32;
      onClicked: {
        var characters = flaptext.text.split("");
        for (var i = 0; i < flapboard.length && i < characters.length; i++) {
          var flapchar = characters[i];
          flapboard[i].setFlap(flapchar);
        }
      }
      text: "Set";
    }
    Rectangle {
      color: "white";
      width: 736;
      x: 512;
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

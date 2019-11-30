import QtQuick 2.0

import "../" as Main;

Item {
  id: clockBox;
  //Screensaver properties
  property int animationDuration: 300;
  property string upperColor: "#303030"
  property string midColor: "#202020";
  property string lowerColor: "101010";
  //Internal properties
  width: 1028;
  height: 672;
  property int lastHours: new Date().getHours();
  property int lastMinutes: new Date().getMinutes();
  property string currentHours: lastHours.toString();
  property string currentMinutes: lastMinutes.toString();

  property string initialHours;
  property string initialMinutes;
  property bool justStarted: true;

  Rectangle {
    id: clockContainer;
    x: 0;
    y: 0;
    width: parent.width;
    height: parent.height;
    color: "#0c0c0c";

    Grid {
      id: clock;
      x: 32;
      y: 0;
      width: parent.width - 32;
      height: parent.height;
      rows: 1;
      columns: 2;
      spacing: 16;
      Main.Flap {
        id: flap_hours;
        flapWidth: 600;
        flapHeight: 688;
        flapSequence: [" 0", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23"];
        flapText: initialHours;
        flapFontSize: 426;
        flapAnimDuration: animationDuration;
        flapPlain: false;
      }
      Main.Flap {
        id: flap_minutes;
        flapWidth: 600;
        flapHeight: 688;
        flapSequence: ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"];
        flapText: initialMinutes;
        flapFontSize: 426;
        flapAnimDuration: animationDuration;
        flapPlain: false;
      }
    }
  }

  Timer {
    id: timerclock;
    running: clockBox.visible;
    repeat: true;
    interval: 1000;
    triggeredOnStart: true;
    onTriggered: {
      if (justStarted) {
        initClock();
      }
      var currentDate = new Date();
      currentMinutes = currentDate.getMinutes();
      currentHours = currentDate.getHours();
      if (lastHours !== currentDate.getHours()) {
        lastHours = currentHours;
        currentHours = (' ' + currentHours.toString()).slice(-2);
        flap_hours.flip(currentHours);
      }
      if (lastMinutes !== currentMinutes) {
        lastMinutes = currentMinutes;
        currentMinutes = ('0' + currentMinutes.toString()).slice(-2);
        flap_minutes.flip(currentMinutes);
      }
    }
  }

  function initClock() {
    initialHours = (' ' + currentHours.toString()).slice(-2);
    initialMinutes = ('0' + currentMinutes.toString()).slice(-2);
    justStarted = false;
  }

}

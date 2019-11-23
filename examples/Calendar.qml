import QtQuick 2.0

import "../" as Main;

Item {
  width: 1280;
  height: 720;

  //Common part for all Widgets
  id: calendar;
  //Screensaver properties
  property int animationDuration: 300;
  property string upperColor: "#303030"
  property string midColor: "#202020";
  property string lowerColor: "101010";
  property string backgroundColorHigh: "#f0f0f0";
  property string backgroundColorLow: "#d0d0d0";
  //Internal properties
  readonly property var initialDate: new Date();
  property int lastDay: initialDate.getDate();
  property string lastMonth: Qt.locale().monthName(initialDate.getMonth()).substring(0, 3);
  property string lastWeekday: Qt.locale().dayName(initialDate.getDay());
  property int lastHours: initialDate.getHours();
  property int lastMinutes: initialDate.getMinutes();

  property string currentDay: lastDay.toString();
  property string currentMonth: lastMonth;
  property string currentWeekday: lastWeekday;
  property string currentHours: lastHours.toString();
  property string currentMinutes: lastMinutes.toString();

  property string initialDay;
  property string initialMonth;
  property string initialWeekday;
  property string initialHours;
  property string initialMinutes;
  property bool justStarted: true;

  //Sequences
  property var monthSequence: [];
  property var weekdaySequence: [];

  Rectangle {
    id: calendarContainer;
    x: 0;
    y: 0;
    width: parent.width;
    height: parent.height;
    gradient: Gradient {
      GradientStop { position: 0.0; color: backgroundColorHigh }
      GradientStop { position: 1.0; color: backgroundColorLow }
    }

    Item {
      id: calendarBox;
      x: 32;
      y: 32;
      width: 1248;
      height: 688;
      Row {
        spacing: 32;
        width: 1248;
        height: 688;
        Column {
          width: 592;
          Row {
            y: 64;
            Main.Flap {
              id: flap_date;
              flapWidth: 256;
              flapHeight: 256;
              flapSequence: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"];
              flapText: initialDay;
              flapFontSize: 182;
              flapAnimDuration: animationDuration;
              flapPlain: false;
            }
            Main.Flap {
              id: flap_month;
              flapWidth: 256;
              flapHeight: 256;
              flapTextPosition: textPosition_Top;
              flapSequence: monthSequence;
              flapText: initialMonth;
              flapFontSize: 104;
              flapAnimDuration: animationDuration;
              flapPlain: false;
            }
          }

          Row {
            y: 336;
            Main.Flap {
              id: flap_weekday;
              flapWidth: 512;
              flapHeight: 256;
              flapSequence: weekdaySequence;
              flapText: initialWeekday;
              flapFontSize: 128;
              flapAnimDuration: animationDuration;
              flapPlain: false;
            }
          }
        }
        Column {
          width: 592;
          Row {
            y: 64;
            Main.Flap {
              id: flap_hours;
              flapWidth: 256;
              flapHeight: 256;
              flapSequence: [" 0", " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23"];
              flapText: initialHours;
              flapFontSize: 182;
              flapAnimDuration: animationDuration;
              flapPlain: false;
            }
            Main.Flap {
              id: flap_minutes;
              flapWidth: 256;
              flapHeight: 256;
              flapSequence: ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"];
              flapText: initialMinutes;
              flapFontSize: 182;
              flapAnimDuration: animationDuration;
              flapPlain: false;
            }
          }
        }
      }
    }
  }

  Timer {
    id: dator60clock;
    running: calendar.visible;
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
      currentDay = currentDate.getDate();
      currentMonth = Qt.locale().monthName(currentDate.getMonth()).substring(0, 3);;
      currentWeekday = Qt.locale().monthName(currentDate.getMonth());
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
      if (lastDay !== currentDay) {
        lastDay = currentDay;
        flap_date.flip(currentDay);
      }
      if (lastMonth !== currentMonth) {
        lastMonth = currentMonth;
        flap_month.flip(currentMonth);
      }
      if (lastWeekday !== currentWeekday) {
        lastWeekday = currentWeekday;
        flap_weekday.flip(currentWeekday);
      }
    }
  }

  function initClock() {
    initialHours = (' ' + currentHours.toString()).slice(-2);
    initialMinutes = ('0' + currentMinutes.toString()).slice(-2);
    initialDay = currentDay;
    initialMonth = currentMonth;
    initialWeekday = currentWeekday;
    //Create sequences
    var dummyDate = new Date();
    for (var i = 0; i < 12; i++) {
      dummyDate.setMonth(i);
      monthSequence.push(Qt.locale().monthName(dummyDate.getMonth()).substring(0, 3));
    }
    dummyDate.setTime(345600000); //First monday since epoch day
    for (i = 0; i < 7; i++) {
      weekdaySequence.push(Qt.locale().monthName(dummyDate.getMonth()));
      dummyDate.setDate(dummyDate.getDate() + 1)
    }
    justStarted = false;
  }

}

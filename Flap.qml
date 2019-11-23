import QtQuick 2.0

/* Flap.qml
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

Item {

  id: flap;
  property int flapWidth: 128;
  property int flapHeight: 98;
  property var flapSequence: [];
  property int flapFontSize: 182;
  property string flapFontFamily: "Helvetica";
  property string flapText: " ";
  property int flapAnimDuration: 80;
  property int backupAnimDuration: flapAnimDuration;
  property int intervalTimeout: flapAnimDuration;
  property string brightColor: "#303030";
  property string midColor: "#101010";
  property string darkColor: "#000000";
  property string textColor: "white";
  property string backgroundColor: "#0c0c0c";

  property int status: -1;

  property variant execSequence: [];
  width: flapWidth;
  height: (flapHeight * 2) + 1;

  Flipable {
    id: upperFlap;
    z: 10;
    y: 0;
    width: flapWidth;
    height: flapHeight;

    property bool flipped: false;
    property int angle: 0;
    front: Item {
      anchors.fill: parent;
      Rectangle {
        id: upperFlapRect;
        y: 0;
        width: parent.width;
        height: parent.height;
        gradient: Gradient {
          GradientStop { position: 0.0; color: brightColor }
          GradientStop { position: 1.0; color: midColor }
        }
        Item { //This item, seems useless, but trust me, it's the only way to solve the flap paradox
          anchors.horizontalCenter: parent.horizontalCenter;
          y: 0;
          width: parent.width;
          height: parent.height;
          Text {
            id: upperFlapText;
            z: 1;
            color: textColor;
            font.family: flapFontFamily;
            font.pixelSize: flapFontSize;
            text: flapText;
            y: parent.height - (flapFontSize / 2);
            horizontalAlignment: Text.AlignHCenter;
            verticalAlignment: Text.AlignTop;
            clip: true;
            elide: Text.ElideRight;
            width: parent.width;
            height: parent.height - y;
          }
        }
      }
      Rectangle { //Shadow
        id: upperFlapShadow;
        color: "#0c0c0c";
        opacity: 0;
        anchors.fill: parent;
        visible: upperFlap.flipped;
      }
      SequentialAnimation {
        running: upperFlap.flipped;
        NumberAnimation {
          target: upperFlapShadow;
          property: "opacity";
          from: 0.0;
          to: 0.5;
          duration: flapAnimDuration;
        }
      }
    }

    back: Rectangle { color: "#101010"; anchors.fill: parent }

    transform: Rotation {
      id: upperRotation
      origin.x: 0;
      origin.y: flapHeight;
      axis.x: 1; axis.y: 0; axis.z: 0     // set axis.y to 1 to rotate around y-axis
      angle: upperFlap.angle;    // the default angle
    }

    states: State {
      name: "back"
      PropertyChanges { target: upperRotation; angle: -90 }
      when: upperFlap.flipped
    }

    transitions: Transition {
      NumberAnimation { target: upperRotation; property: "angle"; duration: flapAnimDuration;}
    }
  }

  Rectangle {
    id: upperFlapPlaceholder;
    z: 9;
    y: 0;
    width: flapWidth;
    height: flapHeight;
    gradient: Gradient {
      GradientStop { position: 0.0; color: brightColor }
      GradientStop { position: 1.0; color: midColor }
    }
    Item { //This item, seems useless, but trust me, it's the only way to solve the flap paradox
      anchors.centerIn: parent;
      width: parent.width;
      height: parent.height;
      Text {
        id: upperFlapPlaceholderText;
        z: 1;
        color: textColor;
        font.family: flapFontFamily;
        font.pixelSize: flapFontSize;
        text: flapText;
        y: parent.height - (flapFontSize / 2);
        horizontalAlignment: Text.AlignHCenter;
        verticalAlignment: Text.AlignTop;
        clip: true;
        elide: Text.ElideRight;
        width: parent.width;
        height: parent.height - y;
      }
    }
  }

  Rectangle {
    id: flapSeparator;
    z: 15;
    width: flapWidth;
    y: flapHeight;
    height: 2;
    color: backgroundColor;
  }

  Flipable {
    id: lowerFlap;
    z: 6;
    y: flapHeight + 2;
    width: flapWidth;
    height: flapHeight;

    property bool flipped: false;
    property int angle: 0;

    front: Item {
      anchors.fill: parent;
      Rectangle {
        id: lowerFlapRect;
        width: parent.width;
        height: parent.height;
        gradient: Gradient {
          GradientStop { position: 0.0; color: midColor }
          GradientStop { position: 1.0; color: darkColor }
        }
        Item { //This item, seems useless, but trust me, it's the only way to solve the flap paradox
          anchors.centerIn: parent;
          width: flapWidth;
          height: flapHeight;
          Text {
            id: lowerFlapText;
            z: 1;
            color: textColor;
            font.family: flapFontFamily;
            font.pixelSize: flapFontSize;
            text: flapText;
            y: -(flapFontSize / 2) - 2;
            horizontalAlignment: Text.AlignHCenter;
            clip: false;
            elide: Text.ElideRight;
            width: flapWidth;
            height: flapHeight - y;
          }
        }
      }
    }

    back: Rectangle { color: "#101010"; anchors.fill: parent }

    transform: Rotation {
      id: lowerRotation
      origin.x: 0;
      origin.y: 0;
      axis.x: 1; axis.y: 0; axis.z: 0     // set axis.y to 1 to rotate around y-axis
      angle: lowerFlap.angle;    // MUST BE SET TO 90
    }

    states: State {
      name: "back"
      PropertyChanges { target: lowerRotation; angle: 0 }
      when: lowerFlap.flipped
    }

    transitions: Transition {
      NumberAnimation {
        target: lowerRotation;
        property: "angle";
        duration: flapAnimDuration;
      }
    }
  }

  Rectangle {
    id: lowerFlapPlaceholder;
    z: 5;
    y: flapHeight + 2;
    width: flapWidth;
    height: flapHeight;
    gradient: Gradient {
      GradientStop { position: 0.0; color: midColor }
      GradientStop { position: 1.0; color: darkColor }
    }
    Item { //This item, seems useless, but trust me, it's the only way to solve the flap paradox
      anchors.centerIn: parent;
      anchors.fill: parent;
      Text {
        id: lowerFlapPlaceholderText;
        z: 1;
        color: textColor;
        font.family: flapFontFamily;
        font.pixelSize: flapFontSize;
        text: flapText;
        y: -(flapFontSize / 2) - 2;
        horizontalAlignment: Text.AlignHCenter;
        clip: false;
        elide: Text.ElideRight;
        width: parent.width;
        height: flapHeight - y;
      }
    }
    Rectangle { //Shadow
      id: lowerFlapShadow;
      color: "#0c0c0c";
      opacity: 0.0;
      anchors.fill: parent;
      visible: lowerFlap.flipped;
    }
    SequentialAnimation {
      running: lowerFlap.flipped;
      NumberAnimation {
        target: lowerFlapShadow;
        property: "opacity";
        from: 0.0;
        to: 1.0;
        duration: flapAnimDuration;
      }
    }
  }

  Timer {
    id: flipHandler;
    running: status >= 0;
    interval: intervalTimeout;
    triggeredOnStart: true;
    repeat: true;
    onTriggered: {
      switch(status) {
        //Three steps
      case 0:
        //If execSequence has at least 2 elements, assign to the upper placeholder (the flap behind the upper one) the next character to display
        if(execSequence.length > 1)
          upperFlapPlaceholderText.text = execSequence[1];
        upperFlapPlaceholderText.z = 1; //Set z 1 to upperFlapPlaceholder (from status 2 => 0)
        //Assign to lowerFlapPlaceholder the currently displayed text
        lowerFlapPlaceholderText.text = flapText;
        //Set z to lower flaps higher than the z of the uppers flaps
        lowerFlap.z = -1;
        lowerFlapPlaceholder.z = -1;
        //Reset duration to backup (from status 2 => 0)
        flapAnimDuration = backupAnimDuration;
        //Start animation
        upperFlap.flipped = !upperFlap.flipped;
        //Goto step 1
        status++;
        break;
      case 1:
        //Set angle of lowerFlap to 90
        lowerFlap.angle = 90;
        //Reset z of lower flaps (from step 0 => 1)
        lowerFlap.z = 6;
        lowerFlapPlaceholder.z = 5;
        lowerFlapPlaceholderText.z = 1;
        //If in execSequence there are at least 2 elements, set the flapText to the next element in the sequence
        if(execSequence.length > 1)
          flapText = execSequence[1];
        //Execute the animation
        lowerFlap.flipped = !lowerFlap.flipped;
        //Goto step 2
        status++;
        break;
      case 2:
        //remove first element from the sequence to play
        execSequence = execSequence.splice(1, execSequence.length);
        //Reset z index
        lowerFlapPlaceholderText.z = -1;
        upperFlapPlaceholderText.z = -1;
        //Set upperFlap to start position
        upperFlap.angle = 0;
        //Play a 1 ms animation to reset positions
        backupAnimDuration = flapAnimDuration;
        intervalTimeout = flapAnimDuration;
        flapAnimDuration = 0;
        upperFlap.flipped = !upperFlap.flipped;
        lowerFlap.flipped = !lowerFlap.flipped;
        lowerFlap.angle = 0;
        upperFlap.angle = 0;
        //If there are still elements in the execSequence return to step 0
        if(execSequence.length > 1) {
          status = 0;
        }
        //Otherwise exit setting status to -1
        else {
          lowerFlapPlaceholderText.text = "";
          upperFlapPlaceholderText.text = "";
          status = -1;
        }
        break;
      }
    }
  }

  /**
    * @function flip
    * @description prepare the character sequence for the flapHandler, then start its state machine to flip the flap
    * @param newChar: the new character the flap will display
    * @param force: normally if the currently displayed character is the same of newChar the flap won't move. If set to true will force the flap to flip anyway
    * @return void
    **/

  function flip(newChar, force) {

    var charSeq = [];
    charSeq = charSeq.concat(flap.flapSequence);

    //If flapSequence is a string, convert it to an array
    if(typeof(flap.flapSequence) === "string") {
      charSeq = flap.flapSequence;
      charSeq = flap.flapSequence.split('');
    }

    var currentPosition = charSeq.indexOf(flapText);

    //Check if currentPosition is set
    if(currentPosition === -1)
      currentPosition = 0;

    var destPosition = charSeq.indexOf(newChar);

    //Check if dest Position exists
    if(destPosition === -1)
      return 1;

    //Prepare rotate execSequence
    execSequence = [];

    //Check they're not equal
    if(destPosition === currentPosition && !force) {
      return;
    }
    else if(destPosition > currentPosition) {
      execSequence = charSeq.splice(currentPosition, (destPosition - currentPosition) + 1);
    }
    else {
      execSequence = charSeq.splice(currentPosition, (charSeq.length - currentPosition) + 1);
      var newSequence = charSeq.splice(0, destPosition + 1);
      execSequence = execSequence.concat(newSequence);
      //If destPosition and currentPosition are the same (and force is set) concat flapText at the end
      if(destPosition === currentPosition)
        execSequence = execSequence.concat(flapText);
    }

    //Lock - Start flipping only if there isn't any other task running
    if(status === -1)
      status = 0;

  }

}

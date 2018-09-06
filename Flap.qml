import QtQuick 2.0

/**
  FlapQML - Flap component for QtQuick 2
  Developed by Christian Visintin

MIT License

Copyright (c) 2018 Christian Visintin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
**/

Item {

    id: flap;
    property int flapWidth: 128;
    property int flapHeight: 98;
    property int flapFontSize: flapHeight * 2;
    property string flapFontFamily: "Helvetica";
    property string flapText: " ";
    property int flapAnimDuration: 80;
    property int backupAnimDuration: flapAnimDuration;
    property int intervalTimeout: 80;
    property string brightColor: "#303030";
    property string midColor: "#101010";
    property string darkColor: "#000000";
    property string textColor: "white";

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
        front: Rectangle {
            id: upperFlapRect;
            anchors.fill: parent;
            gradient: Gradient {
                GradientStop { position: 0.0; color: brightColor }
                GradientStop { position: 1.0; color: midColor }
            }
            Text {
                id: upperFlapText;
                z: 1;
                anchors.centerIn: parent;
                anchors.verticalCenterOffset: flapHeight / 2;
                verticalAlignment: Text.AlignVCenter;
                horizontalAlignment: Text.AlignHCenter;
                color: textColor;
                font.family: flapFontFamily;
                font.pixelSize: flapFontSize;
                text: flapText;
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
        Text {
            id: upperFlapPlaceholderText;
            z: 1;
            anchors.centerIn: parent;
            anchors.verticalCenterOffset: flapHeight / 2;
            verticalAlignment: Text.AlignVCenter;
            horizontalAlignment: Text.AlignHCenter;
            color: textColor;
            font.family: flapFontFamily;
            font.pixelSize: flapFontSize;
            text: "";
        }
    }

    Flipable {
        id: lowerFlap;
        z: 6;
        y: flapHeight + 2;
        width: flapWidth;
        height: flapHeight;

        property bool flipped: false;
        property int angle: 0;

        front: Rectangle {
            id: lowerFlapRect;
            anchors.fill: parent;
            gradient: Gradient {
                GradientStop { position: 0.0; color: midColor }
                GradientStop { position: 1.0; color: darkColor }
            }
            Text {
                id: lowerFlapText;
                z: 1;
                anchors.centerIn: parent;
                anchors.verticalCenterOffset: -(flapHeight / 2);
                verticalAlignment: Text.AlignVCenter;
                horizontalAlignment: Text.AlignHCenter;
                font.family: flapFontFamily;
                color: textColor;
                font.pixelSize: flapFontSize;
                text: flapText;
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
        Text {
            id: lowerFlapPlaceholderText;
            z: 1;
            anchors.centerIn: parent;
            anchors.verticalCenterOffset: -(flapHeight / 2);
            verticalAlignment: Text.AlignVCenter;
            horizontalAlignment: Text.AlignHCenter;
            color: textColor;
            font.family: flapFontFamily;
            font.pixelSize: flapFontSize;
            text: ""
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
                lowerFlap.z = 13;
                lowerFlapPlaceholder.z = 12;
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
    * @function rotate
    * @description prepare the character sequence for the flapHandler, then start its state machine to flip the flap
    * @param charSequnece: can be both a string or a string array, and is the sequence of strings (or character) the flap can display
    * @param newChar: the new character the flap will display
    * @param force: normally if the currently displayed character is the same of newChar the flap won't move. If set to true will force the flap to flip anyway
    * @return void
    **/

    function rotate(charSequence, newChar, force) {

        var charSeq = [];
        charSeq = charSeq.concat(charSequence);

        //If charSequence is a string, convert it to an array
        if(typeof(charSequence) === "string") {
            charSeq = charSequence;
            charSeq = charSequence.split('');
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

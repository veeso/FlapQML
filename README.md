# FlapQML

Developed by Christian Visintin
Version 1.0

## Introduction

FlapQML is a component for QtQuick applications useful to create split flap displays or flip clocks. A single component instance is a single flap and is fully customizable.

---

## Implementation

To implement FlapQML you need to include Flap.qml in your project first, then you can instantiate a flap in this way

```qml

Flap {

id: myFlap;
flapWidth: 128; //Width of the flap component
flapHeight: 96; //Height of a single part of the flap component (so the total height the double e.g. 192)
flapFontSize: 164; //Font size in pixel of the text on the flaps
property string flapFontFamily: "Helvetica"; //Family font of the text on the flap
property string flapText: " "; //Text displayed by default on the flap
property int flapAnimDuration: 80; //Duration in milliseconds of the flip animation
property int intervalTimeout: 80; //@! MUST BE THE SAME OF flapAnimDuration
property string brightColor: "#303030"; //Color of the upper part of the upper flap
property string midColor: "#101010"; //color of the lower part of the upper flap and the color of the upper part of the lower flap
property string darkColor: "#000000"; //Color of the lower part of the lower flap
property string textColor: "white"; //Text color of the flap text
}
```

Once a flap has been instantiate, to rotate it, all you have to do is to call **rotate** function in this way

```qml

myFlap.rotate(charSequence, newChar, force)

```

In details:

* charSequence: is the sequence of strings/characters the flap can display, the argument is a string array (can be a string of single character too e.g. "0123456789", the component will transform it then in ['0','1','2'...])
* newChar: the new character the flap will display
* force: normally if the currently displayed character is the same of newChar the flap won't move. If set to true will force the flap to flip anyway

---

## Changelog

### Version 1.0

First release

---

## License

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

---

# FlapQML

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![HitCount](http://hits.dwyl.io/ChristianVisintin/FlapQML.svg)](http://hits.dwyl.io/ChristianVisintin/FlapQML) [![Stars](https://img.shields.io/github/stars/ChristianVisintin/FlapQML.svg)](https://github.com/ChristianVisintin/FlapQML) [![Issues](https://img.shields.io/github/issues/ChristianVisintin/FlapQML.svg)](https://github.com/ChristianVisintin/FlapQML/issues)

Developed by Christian Visintin
Version 2.0.0 ~ 17.11.2019

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

- **charSequence**: is the sequence of strings/characters the flap can display, the argument is a string array (can be a string of single character too e.g. "0123456789", the component will transform it then in ['0','1','2'...])
- **newChar**: the new character the flap will display
- **force**: normally if the currently displayed character is the same of newChar the flap won't move. If set to true will force the flap to flip anyway

### Example

This repository comes with an example, which is basically a 8x3 flapboard. To see how it works open the project in QtCreator.

---

## Changelog

### Version 2.0.0 (17/11/2019)

- Changed license to GNU/GPL3
- Removed intervalDuration property
- Finally flap works fine

### Version 1.0.0

First release

---

## License

Licensed under the GNU GPLv3 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.gnu.org/licenses/gpl-3.0.txt>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

You can read the entire license [HERE](./LICENSE.txt)

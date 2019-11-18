# FlapQML

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![HitCount](http://hits.dwyl.io/ChristianVisintin/FlapQML.svg)](http://hits.dwyl.io/ChristianVisintin/FlapQML) [![Stars](https://img.shields.io/github/stars/ChristianVisintin/FlapQML.svg)](https://github.com/ChristianVisintin/FlapQML) [![Issues](https://img.shields.io/github/issues/ChristianVisintin/FlapQML.svg)](https://github.com/ChristianVisintin/FlapQML/issues)

Developed by *Christian Visintin*  
Version **2.1.0** ~ 18.11.2019

<p align="center">
  <img src="https://github.com/ChristianVisintin/FlapQML/blob/master/img/flapqml.png?raw=true" alt="FlapQML logo"/>
</p>

---

- [FlapQML](#flapqml)
  - [Introduction](#introduction)
  - [Implementation](#implementation)
    - [Documentation](#documentation)
    - [Example](#example)
  - [Changelog](#changelog)
    - [Version 2.0.0 (17/11/2019)](#version-200-17112019)
    - [Version 1.0.0](#version-100)
  - [License](#license)

---

## Introduction

FlapQML is a component for QtQuick applications which can be used to create flapboards, flipclocks and other flap-related stuff.
The component Flap represents a single Flap, which can then be used with other flaps (in a grid for example) to create a board.
These are the main FlapQML features:

- Fully customizable Flap
  - Sizes
  - Font
  - Color
  - Rotation speed
- Built-in rotate function

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
property string backgroundColor: "#0c0c0c"; //Background color
}
```

Once a flap has been instantiate, to flip it, all you have to do is to call **flip** function in this way

```qml

myFlap.flip(charSequence, newChar, force)

```

In details:

- **charSequence**: is the sequence of strings/characters the flap can display, the argument is a string array (can be a string of single character too e.g. "0123456789", the component will transform it then in ['0','1','2'...])
- **newChar**: the new character the flap will display
- **force**: normally if the currently displayed character is the same of newChar the flap won't move. If set to true will force the flap to flip anyway

### Documentation

These are the properties supported by the Flap component.

- **flapWidth**: Total width of the Flap component in pixel
- **flapHeight**: Height of a flap section of the Flap component. The total Height of the flap component will be flapHeight * 2.
- **flapFontSize**: Pixel size of the Flap text. Consider to set it about flapHeight * 1.4
- **flapFontFamily**: the font family used by the Flap component. The original font used by the Solari board is very similiar to Helvetica, so I suggest you going with that.
- **flapText**: The current flap text. It changes when you flip the component.
- **flapAnimDuration**: the duration of a flip animation in milliseconds.
- **brightColor**: Color of the upper part of the flip gradient.
- **midColor**: Color of the middle part of the flip gradient.
- **darkColor**: Color of the lowest part of the flip gradient.
- **backgroundColor**: Background color applied to the little rectangle between the flaps.

### Example

This repository comes with an example, which is basically a 8x3 flapboard. To see how it works open the project in QtCreator.

---

## Changelog

### Version 2.1.0 (18/11/2019)

- Added shadow effect to flaps.
- Fixed text positon

### Version 2.0.0 (17/11/2019)

- Changed license to **GNU/GPL3**
- Removed intervalDuration property
- Finally flap works fine

### Version 1.0.0

First release

---

## License

Licensed under the GNU GPLv3 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

<http://www.gnu.org/licenses/gpl-3.0.txt>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

You can read the entire license [HERE](./LICENSE)

# Pre-work - Calculator

Calculator is a tip calculator application for iOS.

Submitted by: **William Gao**

Time spent: 11 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [ ] Using locale-specific currency and currency thousands separators.
* [ ] UI animations

The following **additional** features are implemented:

- [x] Added sliders to tax and tip selection to allow fine adujstments
- [x] Dark mode to mimick system installed calculator app
- [x] Per person amount includes sales tax

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src="https://imgur.com/jsEYKbY.gif"/>

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app:

The main challenge was navigating around Xcode with all of its menus and windows.  I was able to read and find references online through stackoverflow and Apple's own documentation.  There were a few idiosyncrasies with Swift that I needed to debug. UserDefaults and deciding when labels changed or kept their values turned out to be more work than I originally estimated.

## License

    Copyright [2019] [William Gao]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

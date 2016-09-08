# lcdClock

Goal
Create an LCD clock with HH:MM display. User should be able to set color – both digits and background, set the time-zone and time format – 24hr/12hr. In 12 hour format, show AM/PM.
Make sure the clock rotates correctly when the device is rotated and is displayed properly on different devices.
Requirements
• Make your own seven-segment display using UIViews in Interface Builder. Create a single UIView for a digit and use it for the 4 numbers.
• Use NSTimer to trigger time changes on the screen. Make sure the displayed time is in sync (within a second) with the phone’s clock. ( It can be in a different time zone though)
• The user’s preferences above should be saved using NSUserDefaults. Which means that even after the app is killed and restarted, the app should remember the settings.
• Use an alternate way to save by archiving your objects to your own file.
• You should use autolayout so that the view is displayed consistently across
different devices and orientations. To simplify the autolayout step, you should create a view as a subview of your main view. And on that subview, You should add the 4 views for the digits as subviews.

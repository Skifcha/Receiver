# Receiver
iBeacon signal receiver with unlock emulation.

# Installation
Just launch this app on any real iOS device, it will start to receive iBeacon signals with pre-defined region data. 
iBeacon settings can be changed in Constants.swift file, but I suggest to keep it as it is, 
since it contains the same region data as in [Broadcaster app](https://github.com/Skifcha/Broadcaster).

Make sure you run Receiver.xcworkspace, not Receiver.xcodeproj, since it contains CocoaPods. I've included them into repository so you don't need to install anything external.

Anyway, you can use it with any iBeacon device, just put it's config data inside Constants.swift and relaunch the app.

You need a developer or personal (free) Apple account to run on a real device. 
Select your account under ["General"](http://take.ms/6wiwA) tab in project settings and run the project.

If you are using free Apple account, verify the Developer App certificate for your account is trusted on your device. Open Settings on your device and navigate to General -> Device Management, then select your Developer App certificate to trust it.

It may ask you to change "Bundle Identifier". You can do it on the same page, just change it to whatever unique and run the project.

# Pros
App receives signals from pre-defined region and tries to send HTTP request every 4 seconds.

#### In my case provided HTTP request didn't work, it responds with 503 error, so unlock animation will never be executed. If you want to checkout unlock animation, just comment these two lines of code: [alert](https://github.com/Skifcha/Receiver/blob/6f6a270fd1c05a258405e8fedc736570c49cf025/receiver/Receiver/Managers/Tracking/UnlockSensorHandler.swift#L55) (so it won't distract you) and [return](https://github.com/Skifcha/Receiver/blob/6f6a270fd1c05a258405e8fedc736570c49cf025/receiver/Receiver/Managers/Tracking/UnlockSensorHandler.swift#L56).
#### In this case unlock animation will perform even if backend responds with error.

I wasn't able to make it work in background, since it supposed to work in both – background and foreground by default if user provides "location always usage" permission, because Apple say so.
At the same time it works nice when user turns display ON or when user enters / leaves monitred region even with backgrounded app.

Maybe that happens because of the free account or I'm just missing something. Still curious about this one, will be glad to hear feedback on that.

# Demo
[Demo](https://drive.google.com/open?id=15br3P3yvYEFq12GnGcn283-lxG3pQEF8)

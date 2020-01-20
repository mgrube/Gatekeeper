# Intro
A lot of people think it's really hard to modify or hook signed MacOS applications without disabling SIP. 

In cases where the user installed the application it's easy, you don't need root privileges 
and you can use standard OS features to do it. 

## Conditions
This method only works on applications installed by the user whose account you control. If the account who owns the /Applications folder of the app is the account you're using, you're in business. This applies mostly to MacOS machines
who shipped to individuals and are not part of a large corporate enterprise. Standard users. The application installer
must also not have been run as root or used root permissions to install, as is currently the case with Chrome for example. 

A quick way to determine which apps are modifiable is to navigate to /Applications and type ls -l.
All of the apps that are owned by the user you're running as should be modifiable. 

## Let's begin!

Step 1) Remove the signature

This is the easiest part. For this tutorial, we'll be modifying Firefox, which is a signed app in MacOS.

For this, we use the codesign tool that ships with MacOS:

codesign --remove-signature /Applications/Firefox.app/Contents/MacOS/firefox

This will remove the signature that Gatekeeper is checking. This is a good first step, but doesn't get use all the way there.



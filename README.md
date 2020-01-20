# Intro
A lot of people think it's really hard to modify or hook signed MacOS applications without disabling SIP. In cases where the user installed the application it's easy, you don't need root privileges and you can use standard OS features to do it. What I'm about to share is not really a secret and more of a case of people needing to read man pages. 

## Conditions
This method only works on applications installed by the user whose account you control. If the account who owns the /Applications folder of the app is the account you're using, you're in business. This applies mostly to MacOS machines
who shipped to individuals and are not part of a large corporate enterprise. Standard users. The application installer
must also not have been run as root or used root permissions to install, as is currently the case with Chrome for example. 

A quick way to determine which apps are modifiable is to navigate to /Applications and type ls -l.
All of the apps that are owned by the user you're running as should be modifiable. 

This can be accomplished in just two steps:

### Step 1: Remove the signature

This is the easiest part. For this tutorial, we'll be modifying Firefox, which is a signed app in MacOS.

For this, we use the codesign tool that ships with MacOS:

codesign --remove-signature /Applications/Firefox.app/Contents/MacOS/firefox

This will remove the signature that Gatekeeper is checking. This is a good first step, but doesn't get use all the way there.

### Step 2: Remove Gatekeeper's quarantine file attribute

MacOS has an interesting issue to solve: How do they allow developers to write code that runs in their personal folders without needing a signature(signing something every time you compiled it would be a major pain)? Answer: File attributes. Gatekeeper knows whether or not to apply the standard signature checks with the use of the com.apple.quarantine file attribute. 

To remove this annoyance, let's get rid of that annoying little attribute for the whole firefox folder:

xattr -r -d com.apple.quarantine /Applications/Firefox.app/

...
...

That's it! You can now modify Firefox to your whimsy. This would be ideal for viral code that infects applications, but also 
works for any sort of persistence or surveillance methods for a specific application. 

Here is a video of me doing this with Google Chrome after installing as myself:

[![Gatekeeper](https://img.youtube.com/vi/JzS6wfouT8s/0.jpg)](https://www.youtube.com/watch?v=JzS6wfouT8s)

I've attached a demonstration script that will work on Firefox if *your* user installed it. 

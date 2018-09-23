PARAMETER=$(echo $1 | tr '[A-Z]' '[a-z]')
if [[ "$PARAMETER" =~ "uninstall" ]]; then
	sudo rm -f /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/libstdc++*
	sudo rm -f /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/libstdc++*
	sudo rm -f /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/libstdc++*
	sudo rm -f /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib/libstdc++*
	echo "libstdc++ uninstall success."
elif [[ "$PARAMETER" =~ "install" ]]; then
	sudo cp ./iPhoneOS.platform/libstdc++* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/lib/
	sudo cp ./iPhoneOS.platform/CoreSimulator/libstdc++* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime/Contents/Resources/RuntimeRoot/usr/lib/
	sudo cp ./iPhoneSimulator.platform/libstdc++* /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk/usr/lib/
	sudo cp ./MacOSX.platform/libstdc++* /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/lib
	echo "libstdc++ install success."
else
	echo "Use -install or -uninstall parameter please."
	echo "libstdc++ extract from Xcode 9.4."
fi

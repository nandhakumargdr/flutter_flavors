# multi_flavors

Multiple environment for Android and iOS

# Knowledge source


https://www.youtube.com/watch?v=AxEmcv0askc
https://www.youtube.com/watch?v=AlOi26zLjyg


https://medium.com/flutter-community/flutter-ready-to-go-e59873f9d7de
https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b
http://cogitas.net/creating-flavors-of-a-flutter-app/
https://iiro.dev/separating-build-environments/
https://blog.codemagic.io/environments-in-flutter-with-codemagic-cicd/
https://thomasgallinari.medium.com/build-for-multiple-environments-with-flutter-flavors-e7a0c973f54e
https://medium.com/@salvatoregiordanoo/flavoring-flutter-392aaa875f36
https://www.tengio.com/blog/multiple-firebase-environments-with-flutter/

# Scripts

## Android
flavorDimensions "flavors"
productFlavors {
    development {
        dimension "flavors"
        applicationIdSuffix ".development"
        versionNameSuffix " Dev"
    }
    qa {
        dimension "flavors"
        applicationIdSuffix ".staging"
        versionNameSuffix " Stage"
    }
    production {
        dimension "flavors"
    }
}

## iOS

if [ "${CONFIGURATION}" == "Debug-production" ] || [ "${CONFIGURATION}" == "Release-production" ] || [ "${CONFIGURATION}" == "Release" ]; then
cp -r "${PROJECT_DIR}/Runner/Firebase?production/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Production firebase plist copied"

elif [ "${CONFIGURATION}" == "Debug-development" ] || [ "${CONFIGURATION}" == "Release-development" ] || [ "${CONFIGURATION}" == "Debug" ]; then
cp -r "${PROJECT_DIR}/Runner/Firebase?development/GoogleService-Info.plist" "${PROJECT_DIR}/Runner/GoogleService-Info.plist"

echo "Development firebase plist copied"
fi
echo '开始打包'
pwd
cd ./../Example
pwd

BUILD_RESULT_PATH="BUILD_RESULT_PATH"
WORKSPACE_NAME="FTNetworking"
SDK_SCHEME_NAME="FTNetworking"
BUNDLE_SCHEME_NAME="FTNetworking"
CONFIGURATION_CUSTOM="Release"
BUNDLE_PATH=./${BUILD_RESULT_PATH}/Build/Products/${CONFIGURATION_CUSTOM}-iphoneos/${BUNDLE_SCHEME_NAME}.bundle

xcodebuild clean
#xcodebuild -workspace IJLogin.xcworkspace -scheme IJLogin-IJLogin -configuration Realease -destination 'generic/platform=iOS' -derivedDataPath "./${BUILD_RESULT_PATH}"
xcodebuild -workspace "${WORKSPACE_NAME}.xcworkspace" -scheme "${BUNDLE_SCHEME_NAME}" -configuration ${CONFIGURATION_CUSTOM} -destination 'generic/platform=iOS' -derivedDataPath "./${BUILD_RESULT_PATH}"


# Install dir will be the final output to the framework.
# The following line create it in the root folder of the current project.
# Working dir will be deleted after the framework creation.

# -configuration ${CONFIGURATION}

xcodebuild archive -workspace "${WORKSPACE_NAME}.xcworkspace" -scheme ${SDK_SCHEME_NAME} -destination "generic/platform=iOS" -archivePath "${BUILD_RESULT_PATH}/${SDK_SCHEME_NAME}-iOS" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild archive -workspace "${WORKSPACE_NAME}.xcworkspace" -scheme ${SDK_SCHEME_NAME} -destination "generic/platform=iOS Simulator" -archivePath "${BUILD_RESULT_PATH}/${SDK_SCHEME_NAME}-iOS-Simulator" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework  -framework "./${BUILD_RESULT_PATH}/${SDK_SCHEME_NAME}-iOS-Simulator.xcarchive/Products/Library/Frameworks/${SDK_SCHEME_NAME}.framework" -framework "./${BUILD_RESULT_PATH}/${SDK_SCHEME_NAME}-iOS.xcarchive/Products/Library/Frameworks/${SDK_SCHEME_NAME}.framework"  -output "./${BUILD_RESULT_PATH}/Products/Library/Frameworks/${SDK_SCHEME_NAME}.xcframework"

#xcodebuild archive -workspace IJLogin.xcworkspace -scheme IJLogin-IJLogin -destination "generic/platform=iOS" -archivePath "archives/IJLogin.bundle" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
cp -R "${BUNDLE_PATH}" "${BUILD_RESULT_PATH}/Products/Library/Frameworks/${BUNDLE_SCHEME_NAME}.bundle"
open "${BUILD_RESULT_PATH}/Products/Library/Frameworks"

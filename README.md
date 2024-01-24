### flutter-module-rn
wrapper flutter module for react native

### flutter_module 
flutter module is a flutter project that can be used as a library in other flutter projects.

### miniflutter
demo reactnative project that uses flutter_module as a library

### How to use 

cd flutter-module-rn 

npm i 

npm run rn:build
npm run ios:buildson
npm run android:build


cd miniflutter 

yarn add  file:../flutter-module-rn


### ios
add to podfile

require_relative '../node_modules/flutter-module-rn/ios/pods'
use_flutter_module_rn!()


then `pod install`

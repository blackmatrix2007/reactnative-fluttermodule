import {
  requireNativeComponent,
  UIManager,
  Platform,
  type ViewStyle,
} from 'react-native';
import { NativeModules } from 'react-native';


const LINKING_ERROR =
  `The package 'flutter-module-rn' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

type FlutterModuleRnProps = {
  color: string;
  style: ViewStyle;
};

const ComponentName = 'FlutterModuleRnView';

export const FlutterModuleRnView =
  UIManager.getViewManagerConfig(ComponentName) != null
    ? requireNativeComponent<FlutterModuleRnProps>(ComponentName)
    : () => {
        throw new Error(LINKING_ERROR);
      };

      

      
      export const FlutterModuleRn = NativeModules.FlutterModuleRn
  ? NativeModules.FlutterModuleRn
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );





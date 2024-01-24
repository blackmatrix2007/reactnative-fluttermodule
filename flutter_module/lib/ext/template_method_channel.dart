import 'package:camera_package_smart_capture/mp_register_channel_runtime.dart';
import 'package:flutter/material.dart';
import 'package:mp_connectivity_plus_runtime/mp_connectivity_plus_runtime.dart';
import 'package:mp_convert_image_to_pdf_runtime/mp_register_channel_runtime.dart';
import 'package:mp_device_info_plus_runtime/mp_register_channel_runtime.dart';
import 'package:mp_encrypt_runtime/mp_register_channel_runtime.dart';
import 'package:mp_file_picker_runtime/mp_file_picker_runtime.dart';
import 'package:mp_flutter_runtime/mp_flutter_runtime.dart';
import 'package:mp_image_editor_custom_runtime/mp_register_channel_runtime.dart';
import 'package:mp_lottie_runtime/mp_lottie_runtime.dart';
import 'package:mp_switch_runtime/mp_switch_runtime.dart';
import 'package:mp_syncfunsion_flutter_pdfviewer_runtime/pdf_viewer.dart';
import 'package:mp_view_pdf_runtime/mp_register_channel_runtime.dart';
import '../main.dart';

class TemplateMethodChannel extends MPMethodChannel {
  TemplateMethodChannel() : super('com.mpflutter.templateMethodChannel');

  @override
  Future? onMethodCall(String method, params) async {
    print("method TemplateMethodChannel : " + method);

    if (method == 'getDeviceName') {
      return 'FlutterClient';
    }
    return super.onMethodCall(method, params);
  }
}

class TemplateFooView extends MPPlatformView {
  TemplateFooView({
    Key? key,
    Map? data,
    Map? parentData,
    required componentFactory,
  }) : super(
          key: key,
          data: data,
          parentData: parentData,
          componentFactory: componentFactory,
        );

  @override
  Future onMethodCall(String method, params) {
    // Handle method call here.
    return super.onMethodCall(method, params);
  }

  @override
  Widget builder(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class TemplateTextView extends MPPlatformView {
  TemplateTextView({
    Key? key,
    Map? data,
    Map? parentData,
    required componentFactory,
  }) : super(
          key: key,
          data: data,
          parentData: parentData,
          componentFactory: componentFactory,
        );

  @override
  Future onMethodCall(String method, params) {
    // Handle method call here.
    return super.onMethodCall(method, params);
  }

  @override
  Widget builder(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 100,
      child: TextField(
          controller: TextEditingController(),
          focusNode: FocusNode(),
          style: TextStyle()),
    );
  }
}

void extBeforeInitState() {
  registerCameraPreview(
      context: NavigationService.navigatorKey.currentContext!);
  registerImageEditorPlus(
      context: NavigationService.navigatorKey.currentContext!);
  registerOpenPdfFile(context: NavigationService.navigatorKey.currentContext!);
}

void extMain() {
  MPPluginRegister.registerChannel(
    'com.mpflutter.templateMethodChannel',
    () => TemplateMethodChannel(),
  );
  MPPluginRegister.registerPlatformView(
    'com.mpflutter.templateFooView',
    (key, data, parentData, componentFactory) => TemplateFooView(
      key: key,
      data: data,
      parentData: parentData,
      componentFactory: componentFactory,
    ),
  );
  MPPluginRegister.registerPlatformView(
    'com.mpflutter.templateTextView',
    (key, data, parentData, componentFactory) => TemplateTextView(
      key: key,
      data: data,
      parentData: parentData,
      componentFactory: componentFactory,
    ),
  );
  registerSwitch();
  registerLottie();
  registerFilePicker();
  registerSfPdfViewer();
  registerConvertImageToPDF();
  registerDeviceInfoPlus();
  registerEncrypt();
  registerConnectivity();
}

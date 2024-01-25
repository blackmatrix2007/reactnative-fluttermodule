import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.yellow,
    );
  }
}

// Khanhdh/ 123456a@A
class SmartMyHomePage extends StatefulWidget {
  const SmartMyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TestMyHomePageState();
  }
}

class _TestMyHomePageState extends State<SmartMyHomePage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SetIPScreen();
  }
}

class SetIPScreen extends StatefulWidget {
  const SetIPScreen({Key? key}) : super(key: key);

  @override
  State<SetIPScreen> createState() => _SetIPScreenState();
}

class _SetIPScreenState extends State<SetIPScreen> {
  Future<dynamic> _handleMessage(MethodCall call) async {
    if (call.method == 'reportCounter') {
    } else if (call.method == 'miniapp') {
      String params = call.arguments as String;
      _getBatteryLevel(params);
    }
  }

  String _accessToken = "";
  String _refreshToken = "";
  String _ip = "";
  bool _devMode = false;
  Future<void> _getBatteryLevel(String params) async {
    print("sondh32 1");
    try {
      print("sondh32 " + params!);

      final data = jsonDecode(params);
      _accessToken = data["accessToken"];
      _refreshToken = data["refreshToken"];
      _devMode = data["devMode"] as bool;
      _ip = data["ip"];
      setState(() {
        _accessToken;
        _refreshToken;
      });
      // });
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  final platform = const MethodChannel('dev.flutter.example/counter');
  Uint8List? data;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() async {
        platform.setMethodCallHandler(_handleMessage);
        data = ((await rootBundle.load('assets/smartcapture.mpk'))
            .buffer
            .asUint8List());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (data != null && _accessToken != "" && _refreshToken != "") {
      //generate page with container
      return Container(
        child: Text("Hello" + _accessToken),
      );
    } else {
      return Container();
    }
  }
}

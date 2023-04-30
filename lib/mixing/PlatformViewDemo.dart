import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformViewDemo extends StatefulWidget {
  @override
  _PlatformViewDemoState createState() => _PlatformViewDemoState();
}

class _PlatformViewDemoState extends State<PlatformViewDemo> {
  static const platform =
      const MethodChannel('com.flutter.guide.MyFlutterView');

  @override
  Widget build(BuildContext context) {
		Widget platformView() {
      if (defaultTargetPlatform == TargetPlatform.android) {
        return AndroidView(
          viewType: 'plugins.flutter.io/custom_platform_view',
          creationParams: {'text': 'Flutter传给AndroidTextView的参数'},
          creationParamsCodec: StandardMessageCodec(),
        );
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        return UiKitView(
          viewType: 'plugins.flutter.io/custom_platform_view',
          creationParams: {'text': 'Flutter传给IOSTextView的参数'},
          creationParamsCodec: StandardMessageCodec(),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        RaisedButton(
          child: Text('传递参数给原生View'),
          onPressed: () {
            platform.invokeMethod('setText', {'name': 'laomeng', 'age': 18});
          },
        ),
        Expanded(child: platformView()),
      ]),
    );
  }
}
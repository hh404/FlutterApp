import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("Demo Project"),
//         ),
//         body: Center(child: new Text("H1ello World1231999666!!!")),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text("Demo Project"),
//         ),
//         body: UiKitView(
//           viewType: 'plugins.flutter.io/custom_platform_view',
//           creationParams: {'text': 'Flutter传给IOSTextView的参数'},
//           creationParamsCodec: StandardMessageCodec(),
//         ),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
   static const platform =
      const MethodChannel('com.flutter.guide.MyFlutterView');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Demo Project"),
        ),
        body: Column(children: [
        ElevatedButton(
          child: Text('传递参数给原生View'),
          onPressed: () {
            platform.invokeMethod('setText', {'name': 'laomeng', 'age': 18});
          },
        ),
        Expanded(child: UiKitView(
          viewType: 'plugins.flutter.io/custom_platform_view',
          creationParams: {'text': 'Flutter传给IOSTextView的参数'},
          creationParamsCodec: StandardMessageCodec(),
        )),
      ]),
      ),
    );
  }
}
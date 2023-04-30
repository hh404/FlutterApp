import 'package:flutter/material.dart';

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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Demo Project"),
        ),
        body: UiKitView(
          viewType: 'plugins.flutter.io/custom_platform_view',
        ),
      ),
    );
  }
}
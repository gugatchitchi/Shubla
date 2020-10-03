import 'package:flutter/material.dart';
import 'screens/screens.dart';
import 'configs/configs.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shubla',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   backgroundColor: Colors.yellow,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: Scaffold(
        backgroundColor: Palette.bg,
        body: Categories(),
      ),
    );
  }
}

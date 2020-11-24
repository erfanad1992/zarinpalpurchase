import 'package:flutter/material.dart';

import 'HomeBrowser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zarinpal flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,

      ),
      home: HomeBrowser(title: 'zarinpal flutter'),

    );
  }
}


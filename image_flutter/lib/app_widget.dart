import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_flutter/pages/home.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.deepPurpleAccent,
      )),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

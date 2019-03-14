import 'package:flutter/material.dart';
import 'package:sample_notification_app/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var title = "Notification Sample";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "$title",
      debugShowCheckedModeBanner: false,
      home: Home(
        header: "$title",
      ),

      theme: ThemeData(
//        primarySwatch: Colors.white,
        primaryColor: Colors.white,
        accentColor: Colors.blue,
      ),
    );
  }
}

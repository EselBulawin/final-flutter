import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(PublishersHubApp());

class PublishersHubApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Publishers Hub',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

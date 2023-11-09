import 'package:coffeshop/pages/sidebar/side_bar_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Appcoffe",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SideBarPage(),
    );
  }
}

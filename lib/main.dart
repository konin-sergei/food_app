import 'package:flutter/material.dart';
import 'package:food_app/pages/detail_page.dart';

import 'pages/main_page.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food app",
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/detail': (context) => const DetailPage(''),
      },
    );
  }
}

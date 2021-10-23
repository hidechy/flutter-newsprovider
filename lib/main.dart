import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/HeadlineNewsScreen.dart';

import './controllers/HeadlineNewsController.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HeadlineNewsController(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: HeadlineNewsScreen(),
    );
  }
}

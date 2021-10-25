import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/HomeScreen.dart';

import './controllers/HeadlineNewsController.dart';
import './controllers/CategoryNewsController.dart';

void main() {
  runApp(
    // runApp(ChangeNotifierProvider(
    //   create: (context) => HeadlineNewsController(),
    //   child: MyApp(),
    // ));

    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HeadlineNewsController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryNewsController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const HomeScreen(),
    );
  }
}

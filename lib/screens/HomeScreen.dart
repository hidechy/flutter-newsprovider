// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'CategoryNewsScreen.dart';
import 'HeadlineNewsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    const HeadlineNewsScreen(),
    CategoryNewsScreen()
  ];

  int _currentIndex = 0;

  ///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.highlight), label: 'Headline'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

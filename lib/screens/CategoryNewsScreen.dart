// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/CategoryNewsController.dart';

import './components/NewsList.dart';

class CategoryNewsScreen extends StatelessWidget {
  final List<List<String>> _categories = [
    ['general', '総合'],
    ['business', 'ビジネス'],
    ['entertainment', 'エンターテインメント'],
    ['technology', 'テクノロジー'],
    ['science', '科学'],
    ['sports', 'スポーツ']
  ];

  final int _selectedCategory = 0;

  Size size = const Size(0, 0);

  var response;

  CategoryNewsScreen({Key? key}) : super(key: key);

  ///
  @override
  Widget build(BuildContext context) {
    response = Provider.of<CategoryNewsController>(context, listen: true);

    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Category News'),
        centerTitle: true,
        actions: const [],
      ),
      body: Column(
        children: [
          _makeCategoryChips(),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.yellowAccent.withOpacity(0.3),
            ),
            child: Text(response.category),
          ),
          Expanded(
            child: NewsList(
              response: response,
            ),
          ),
        ],
      ),
    );
  }

  ///
  Widget _makeCategoryChips() {
    return Table(
      children: [
        TableRow(
          children: [
            _makeChip(number: 0),
            _makeChip(number: 1),
            _makeChip(number: 2),
          ],
        ),
        TableRow(
          children: [
            _makeChip(number: 3),
            _makeChip(number: 4),
            _makeChip(number: 5),
          ],
        ),
      ],
    );
  }

  ///
  Widget _makeChip({required int number}) {
    return ChoiceChip(
      backgroundColor: Colors.black.withOpacity(0.1),
      selectedColor: Colors.black.withOpacity(0.1),
      label: Container(
        alignment: Alignment.center,
        width: (size.width / 3) - 40,
        child: Text(
          _categories[number][1],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
      selected: _selectedCategory == number,
      onSelected: (bool isSelected) {
        response.handleCategoryChip(chipValue: _categories[number][0]);
      },
    );
  }
}

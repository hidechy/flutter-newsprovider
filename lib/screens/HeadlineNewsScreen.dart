// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/HeadlineNewsController.dart';

import './components/NewsList.dart';

class HeadlineNewsScreen extends StatelessWidget {
  const HeadlineNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var response = Provider.of<HeadlineNewsController>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Headline News'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.call_received),
            onPressed: () {
              response.handleGetHeadlineNewsButton();
            },
            color: Colors.greenAccent,
          ),
        ],
      ),
      body: NewsList(
        response: response,
      ),
    );
  }
}

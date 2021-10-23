import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/HeadlineNewsController.dart';

class HeadlineNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var response = Provider.of<HeadlineNewsController>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Headline News'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              response.handleGetHeadlineNewsButton();
            },
            color: Colors.greenAccent,
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.black.withOpacity(0.3),
            leading: Container(
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(response.data[index].urlToImage),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            title: Column(
              children: [
                Text(
                  response.data[index].title,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Divider(
                  color: Colors.indigo,
                ),
                Text(
                  response.data[index].description,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, _) => Divider(),
        itemCount: response.data.length,
      ),
    );
  }
}

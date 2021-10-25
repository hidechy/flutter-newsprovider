// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  var response;

  NewsList({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          tileColor: Colors.black.withOpacity(0.3),
          leading: (response.data[index].urlToImage == null)
              ? const SizedBox(
                  width: 60,
                  child: Icon(Icons.broken_image),
                )
              : Container(
                  width: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(response.data[index].urlToImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          title: Column(
            children: [
              Text(
                response.data[index].title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Divider(
                color: Colors.indigo,
              ),
              Text(
                response.data[index].description,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, _) => const Divider(),
      itemCount: response.data.length,
    );
  }
}

import 'package:baraton_stores/layouts/product_layout.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final spices = [
    'techo',
    'iphone x',
    'lg ',
    'infinix',
    'samsung',
    'xiaomi',
    'nokia'
  ];

  final recentspice = ['techo', 'samsung', 'nokia'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SingleChildScrollView(
      child: ProductLayout(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionlist = query.isEmpty
        ? recentspice
        : spices.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: const Icon(Icons.phone_android),
        title: RichText(
          text: TextSpan(
            text: suggestionlist[index].substring(0, query.length),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionlist[index].substring(query.length),
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionlist.length,
    );
  }
}

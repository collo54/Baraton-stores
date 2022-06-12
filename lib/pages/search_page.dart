import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/search_layout.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SearchLayout(),
          ],
        ),
      ),
    );
  }
}

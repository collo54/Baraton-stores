import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/search_add_cart_layout.dart';
import 'package:flutter/material.dart';

class SearchAddCartPage extends StatelessWidget {
  const SearchAddCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SearchAddCartLayout(),
          ],
        ),
      ),
    );
  }
}

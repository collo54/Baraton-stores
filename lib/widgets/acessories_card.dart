import 'package:baraton_stores/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/text.dart';

class AcessoriesPageCard extends StatelessWidget {
  const AcessoriesPageCard(
      {Key? key,
      required this.image,
      required this.product,
      required this.price})
      : super(key: key);
  final String image;
  final String product;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: kwhite,
        height: 150,
        width: 167,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 69,
              width: 119,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              product,
              style: tlaptopacessoriesname,
            ),
            Text(
              price,
              style: taccessoriesprice,
            ),
          ],
        ),
      ),
    );
  }
}

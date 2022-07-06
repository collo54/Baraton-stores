import 'package:baraton_stores/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/text.dart';

class OtherAccessoriesCard extends StatelessWidget {
  const OtherAccessoriesCard(
      {Key? key,
      required this.widget,
      // required this.image,
      required this.product,
      required this.price})
      : super(key: key);
  // final String image;
  final String product;
  final String price;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: kwhite,
        height: 180,
        width: 167,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget,
            const SizedBox(
              height: 10,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                product,
                style: tlaptopacessoriesname,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Text(
                    'Kes',
                    style: taccessoriesprice,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    price,
                    style: taccessoriesprice,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

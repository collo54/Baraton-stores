import 'package:baraton_stores/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/text.dart';

class CheckoutPageCard extends StatelessWidget {
  const CheckoutPageCard(
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
      color: kwhite,
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 300,
        width: 224,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 22,
                    width: 34,
                    child: Text(
                      'New',
                      style: tnewtext,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 20,
                    color: kgreytext,
                  ),
                )
              ],
            ),
            Image.asset(
              image,
              height: 130,
              width: 97,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product,
                  style: tcartegoriestext,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  price,
                  style: tcheckoutprice,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:baraton_stores/constants/colors.dart';
import 'package:flutter/material.dart';

import '../constants/text.dart';

class HomeCardOrange extends StatelessWidget {
  const HomeCardOrange({
    Key? key,
    required this.ontap,
    required this.texttitle,
    required this.image,
    required this.textsub,
  }) : super(key: key);

  final VoidCallback ontap;
  final String texttitle;
  final String textsub;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        color: kPrimaryOrange,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texttitle,
                    style: thomecardtext,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    textsub,
                    style: tsubtext,
                  ),
                ],
              ),
              Image.asset(
                image,
                height: 70,
                width: 57,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

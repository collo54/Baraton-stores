import 'package:flutter/material.dart';

import '../constants/text.dart';

class CartegoriesCard extends StatelessWidget {
  const CartegoriesCard({
    Key? key,
    required this.ontap,
    required this.text,
  }) : super(key: key);

  final VoidCallback ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Text(
            text,
            style: tcartegoriestext,
          ),
        ),
      ),
    );
  }
}

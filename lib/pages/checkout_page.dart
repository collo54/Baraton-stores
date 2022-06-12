import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/checkout_layout.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            CheckoutLayout(),
          ],
        ),
      ),
    );
  }
}

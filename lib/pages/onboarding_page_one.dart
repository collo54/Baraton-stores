import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/onboarding_layout_one.dart';
import 'package:flutter/material.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OnboardingLayoutOne(),
          ],
        ),
      ),
    );
  }
}

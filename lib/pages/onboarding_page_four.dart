import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/onboarding_layout_four.dart';
import 'package:flutter/material.dart';

class OnboardingPageFour extends StatelessWidget {
  const OnboardingPageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OnboardingLayoutFour(),
          ],
        ),
      ),
    );
  }
}

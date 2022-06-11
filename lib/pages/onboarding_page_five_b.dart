import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/onboarding_layout_five_b.dart';
import 'package:flutter/material.dart';

class OnboardingPageFiveB extends StatelessWidget {
  const OnboardingPageFiveB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OnboardingLayoutFiveB(),
          ],
        ),
      ),
    );
  }
}

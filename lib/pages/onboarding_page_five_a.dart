import 'package:baraton_stores/constants/colors.dart';
import 'package:flutter/material.dart';

import '../layouts/oboarding_layout_five_a.dart';

class OnboardingPageFiveA extends StatelessWidget {
  const OnboardingPageFiveA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OnboardingLayoutFiveA(),
          ],
        ),
      ),
    );
  }
}

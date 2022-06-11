import 'package:baraton_stores/pages/onboarding_page_one.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import 'tab_home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key, required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<UserModel?> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData
          ? const TabHomePage() //  // TapHomePage() replace with this on launch
          : const OnboardingPageOne();
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

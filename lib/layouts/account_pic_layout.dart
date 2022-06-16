import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:baraton_stores/widgets/cartegories_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/account_info_page.dart';

class AccountPicLayout extends StatelessWidget {
  const AccountPicLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: kpagewhite,
        ),
        width: width,
        height: 680,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Account',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildAvator(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildButton(context),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _buildButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CartegoriesCard(ontap: () {}, text: 'Orders'),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AccountInfoPage()),
              );
            },
            text: 'Account Information'),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(ontap: () {}, text: 'security and settings'),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

  _buildAvator(BuildContext context) {
    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    final String? title = FirebaseAuth.instance.currentUser!.displayName;
    return ListTile(
      leading: image != null
          ? ClipOval(child: Image.network(image))
          : ClipOval(child: Image.asset('assets/images/picavator.jpg')),
      title: title != null
          ? Text(
              title,
              style: theadlinetext,
            )
          : Text(
              'user',
              style: theadlinetext,
            ),
      subtitle: Text(
        'Buyer',
        style: tcapacity,
      ),
    );
  }

  _gotoAutheticationpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingPageFour()),
    );
  }
}

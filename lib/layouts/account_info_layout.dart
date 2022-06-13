import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/pages/account_form_page.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:baraton_stores/widgets/account_info_card.dart';
import 'package:flutter/material.dart';

class AccountInfoLayout extends StatelessWidget {
  const AccountInfoLayout({Key? key}) : super(key: key);

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
            'Account Information',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildInfo(context),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AccountFormPage(),
              ),
            );
          },
          child: const AccountInfoCard(
            titletext: 'username',
            subtext: 'jim brian',
            trailingtext: 'change',
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const AccountInfoCard(
          titletext: 'Email',
          subtext: 'jim@gmail.com',
          trailingtext: 'change',
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 15,
        ),
        const AccountInfoCard(
          titletext: 'Phone number',
          subtext: '+254743897134',
          trailingtext: 'change',
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 15,
        ),
        const AccountInfoCard(
          titletext: 'Password',
          subtext: '******',
          trailingtext: 'change',
        ),
        const SizedBox(
          height: 15,
        ),
        const SizedBox(
          height: 15,
        ),
        const AccountInfoCard(
          titletext: 'Account',
          subtext: 'Buyer',
          trailingtext: 'change',
        ),
        const SizedBox(
          height: 55,
        ),
      ],
    );
  }

  _gotoAutheticationpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingPageFour()),
    );
  }
}

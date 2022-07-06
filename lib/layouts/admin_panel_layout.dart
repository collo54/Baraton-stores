import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminPanelLayout extends StatelessWidget {
  const AdminPanelLayout({Key? key}) : super(key: key);

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
            'Admin panel',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildRequests(context),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _buildRequests(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildAvator(context),
        SizedBox(
          height: 10,
        ),
        _buildAvator(context),
        SizedBox(
          height: 10,
        ),
        _buildAvator(context),
        SizedBox(
          height: 10,
        ),
        _buildAvator(context),
        SizedBox(
          height: 10,
        ),
        _buildAvator(context),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  _buildAvator(BuildContext context) {
    final String? image = FirebaseAuth.instance.currentUser!.photoURL;
    final String? title = FirebaseAuth.instance.currentUser!.displayName;
    bool? value = false;
    return Card(
      child: ListTile(
        leading: image != null
            ? ClipOval(child: Image.network(image))
            : ClipOval(child: Image.asset('assets/images/picavator.jpg')),
        title: title != null
            ? Text(title, style: tcartegoriestext)
            : Text(
                'user',
                style: tcartegoriestext,
              ),
        subtitle: Text(
          'Buyer',
          style: tcartegoriestext,
        ),
        trailing: Checkbox(
          value: value,
          tristate: false,
          activeColor: kbluefacebook,
          onChanged: (value) {},
        ),
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

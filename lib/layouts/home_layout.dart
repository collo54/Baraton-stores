import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/pages/cartegories_page.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:baraton_stores/widgets/cartegories_card.dart';
import 'package:baraton_stores/widgets/home_card_orange.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

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
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Home',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildButton(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildButton1(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Sales',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _builditem(context),
        ),
      ],
    );
  }

  _buildButton(BuildContext context) {
    return Container(
      height: 100,
      color: kwhite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeCardOrange(
              ontap: () {
                _gotoCatregoriesPage(context);
              },
              texttitle: 'Bose Home Speaker',
              image: 'assets/images/speaker.png',
              textsub: 'kes 12000'),
          const SizedBox(
            height: 25,
          ),
          HomeCardOrange(
              ontap: () {
                _gotoCatregoriesPage(context);
              },
              texttitle: 'Bose Home Speaker',
              image: 'assets/images/speaker.png',
              textsub: 'kes 12000'),
          const SizedBox(
            height: 25,
          ),
          HomeCardOrange(
              ontap: () {},
              texttitle: 'Bose Home Speaker',
              image: 'assets/images/speaker.png',
              textsub: 'kes 12000'),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  _gotoCatregoriesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartegoriesPage()),
    );
  }

  _buildButton1(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: const CircleBorder(),
                //shadowColor: klabeltext,
                elevation: 0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: klighticon,
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: kPrimaryOrange),
                    onPressed: () {
                      _gotoCatregoriesPage(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  'Cartegories',
                  style: thomeicontext,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: const CircleBorder(),
                //shadowColor: klabeltext,
                elevation: 0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: klighticon,
                  child: IconButton(
                    icon: const Icon(Icons.star_border, color: kPrimaryOrange),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  'Favorites',
                  style: thomeicontext,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: const CircleBorder(),
                //shadowColor: klabeltext,
                elevation: 0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: klighticon,
                  child: IconButton(
                    icon: const Icon(Icons.card_giftcard_outlined,
                        color: kPrimaryOrange),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  'Gifts',
                  style: thomeicontext,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: const CircleBorder(),
                //shadowColor: klabeltext,
                elevation: 0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: klighticon,
                  child: IconButton(
                    icon: const Icon(Icons.group, color: kPrimaryOrange),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Best\nSelling',
                    style: thomeicontext,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _builditem(BuildContext context) {
    return Container(
      height: 261,
      color: kwhite,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
            child: Container(
              color: kwhite,
              height: 251,
              width: 161,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/iphone.png',
                    height: 130,
                    width: 62,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Smartphones',
                    style: tcartegoriestext,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Card(
            child: Container(
              color: kwhite,
              height: 251,
              width: 161,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/iphone.png',
                    height: 130,
                    width: 62,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Smartphones',
                    style: tcartegoriestext,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/pages/apliances_page.dart';
import 'package:baraton_stores/pages/computer_acessories_page.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:baraton_stores/widgets/cartegories_card.dart';
import 'package:flutter/material.dart';

import '../pages/all_products_page.dart';
import '../pages/beauty_page.dart';
import '../pages/clothes_page.dart';
import '../pages/house_items_page.dart';
import '../pages/phones_page.dart';

class CartegoriesLayout extends StatelessWidget {
  const CartegoriesLayout({Key? key}) : super(key: key);

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
            'Cartegories',
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
      ],
    );
  }

  _buildButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AllProductsPage()),
            );
          },
          text: 'All',
        ),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ComputerAcessoriesPage()),
            );
          },
          text: 'Computers & Accessories',
        ),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BeautyPage()),
            );
          },
          text: 'Beauty Products',
        ),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PhonesPage()),
            );
          },
          text: 'Phones & Accessories',
        ),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClothesPage()),
            );
          },
          text: 'Clothes & Accessories',
        ),
        const SizedBox(
          height: 15,
        ),
        CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HouseItemsPage()),
            );
          },
          text: 'Household Items',
        ),
        /* CartegoriesCard(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ApliancesPage()),
            );
          },
          text: 'Apliances',
        ),*/
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

import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:flutter/material.dart';

class ComputerAcessoriesLayout extends StatelessWidget {
  const ComputerAcessoriesLayout({Key? key}) : super(key: key);

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
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Computers & Acessories',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem2(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem3(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem3(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem2(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem3(context),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildItem3(context),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  _buildItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/iphone.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/laptop3.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildItem2(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/iphone.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/laptop3.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildItem3(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/iphone.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/laptop3.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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

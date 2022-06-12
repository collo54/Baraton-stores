import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/custom/data_search.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:flutter/material.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({Key? key}) : super(key: key);

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
            'Search',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildSearchBar(context),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Last Viewed',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildLastViewed(context),
        ),
      ],
    );
  }

  _buildSearchBar(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            showSearch(context: context, delegate: DataSearch());
          },
          child: TextFormField(
              enabled: false,
              style: const TextStyle(fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search_sharp,
                  color: kformlabeltext,
                ),
                fillColor: kformlabel,
                filled: true,
                labelText: 'What are you looking for',
                labelStyle: tformtext,
                focusColor: const Color.fromRGBO(243, 242, 242, 1),
                hintStyle: const TextStyle(color: kwhite),
              ),
              maxLines: 1,
              textAlign: TextAlign.start),
        ),
      ],
    );
  }

  _buildLastViewed(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          child: ListTile(
            tileColor: kwhite,
            leading: Image.asset(
              'assets/images/speaker.png',
              height: 42,
              width: 59,
            ),
            title: Text(
              'Home Bass Speaker',
              style: tcartegoriestext,
            ),
            subtitle: Text(
              'kes 49999',
              style: ttiletext,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Card(
          child: ListTile(
            tileColor: kwhite,
            leading: Image.asset(
              'assets/images/googlehomemini.png',
              height: 42,
              width: 59,
            ),
            title: Text(
              'Google home mini',
              style: tcartegoriestext,
            ),
            subtitle: Text(
              'kes 49999',
              style: ttiletext,
            ),
          ),
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

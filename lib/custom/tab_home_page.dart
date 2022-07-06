import 'package:baraton_stores/custom/cupertino_home_scafold.dart';
import 'package:baraton_stores/custom/tab_item.dart';
import 'package:baraton_stores/pages/checkout_page.dart';
import 'package:baraton_stores/pages/search_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/account_pic_page.dart';
import '../pages/home_page.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  State<TabHomePage> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  TabItem _currentTab = TabItem.home;

  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
      TabItem.home: (_) => const HomePage(),
      TabItem.search: (_) => const SearchPage(),
      TabItem.checkout: (_) => const CheckoutPage(),
      TabItem.account: (_) =>
          AccountPicPage(uid: FirebaseAuth.instance.currentUser!.uid),
    };
  }

  void _select(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoHomeScafold(
      currentTab: _currentTab,
      onSelectTab: _select,
      widgetBuilders: widgetBuilders,
    );
  }
}

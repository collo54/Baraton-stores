import 'package:flutter/material.dart';

enum TabItem { home, search, checkout, account }

class TabItemData {
  const TabItemData({required this.icon});
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.home: TabItemData(icon: Icons.home_outlined),
    TabItem.search: TabItemData(icon: Icons.search_sharp),
    TabItem.checkout: TabItemData(icon: Icons.shopping_cart_outlined),
    TabItem.account: TabItemData(icon: Icons.person_outline_sharp)
  };
}

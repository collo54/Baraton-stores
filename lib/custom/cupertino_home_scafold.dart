import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/custom/tab_item.dart';
import 'package:baraton_stores/pages/home_page.dart';
import 'package:flutter/cupertino.dart';

class CupertinoHomeScafold extends StatelessWidget {
  const CupertinoHomeScafold({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
    required this.widgetBuilders,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _buildItem(TabItem.home),
          _buildItem(TabItem.search),
          _buildItem(TabItem.checkout),
          _buildItem(TabItem.account),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final items = TabItem.values[index];
        return CupertinoTabView(
          builder: (context) => widgetBuilders[items]!(context),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem];
    final color = currentTab == tabItem ? kPrimaryOrange : ktabinactive;
    return BottomNavigationBarItem(
      icon: Icon(
        itemData?.icon,
        color: color,
      ),
    );
  }
}

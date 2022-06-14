import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/house_items.dart';
import 'package:baraton_stores/layouts/house_items_form.dart';
import 'package:flutter/material.dart';

import '../constants/switch.dart';
import '../constants/text.dart';

//enum AccountType { vendor, buyer }

class HouseItemsPage extends StatefulWidget {
  const HouseItemsPage({Key? key}) : super(key: key);

  @override
  State<HouseItemsPage> createState() => _HouseItemsPageState();
}

class _HouseItemsPageState extends State<HouseItemsPage> {
  AccountType _accountType = AccountType.buyer;

  void toggle() {
    setState(
      () {
        _accountType = _accountType == AccountType.buyer
            ? AccountType.vendor
            : AccountType.buyer;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = _accountType == AccountType.buyer
        ? AppBar(
            iconTheme: const IconThemeData(color: kgreytext),
            backgroundColor: kpagewhite,
            elevation: 0,
          )
        : AppBar(
            iconTheme: const IconThemeData(color: kgreytext),
            backgroundColor: kpagewhite,
            elevation: 0,
            actions: [
              IconButton(
                  onPressed: (() {
                    Navigator.of(context, rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => const HouseitemsForm()),
                    );
                  }),
                  icon: const Icon(Icons.add)),
            ],
          );

    final String text = _accountType == AccountType.buyer
        ? 'switch to seller'
        : 'switch to buyer';

    return Scaffold(
      appBar: appBar,
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextButton(
              child: Text(
                text,
                style: tdeliverytext,
              ),
              onPressed: (() => toggle()),
            ),
            const HouseItemsLayout(),
          ],
        ),
      ),
    );
  }
}

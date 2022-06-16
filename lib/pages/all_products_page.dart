import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/all_products_form.dart';
import 'package:baraton_stores/layouts/all_products_layout.dart';
import 'package:flutter/material.dart';

import '../constants/switch.dart';
import '../constants/text.dart';

//enum AccountType { vendor, buyer }

class AllProductsPage extends StatefulWidget {
  const AllProductsPage({Key? key}) : super(key: key);

  @override
  State<AllProductsPage> createState() => _AllProductsPageState();
}

class _AllProductsPageState extends State<AllProductsPage> {
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
                          builder: (context) => const SingleChildScrollView(
                              child: AllProductsForm())),
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
            const AllProductsLayout(),
          ],
        ),
      ),
    );
  }
}

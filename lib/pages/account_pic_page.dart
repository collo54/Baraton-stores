import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/switch.dart';
import 'package:baraton_stores/layouts/account_pic_layout.dart';
import 'package:baraton_stores/layouts/admin_panel._layout.dart';
import 'package:flutter/material.dart';

class AccountPicPage extends StatelessWidget {
  const AccountPicPage({
    Key? key,
    required this.uid,
    this.accountType,
  });
  final String uid;
  final AccountType? accountType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AccountPicLayout(),
            if (uid.toString() == '5eM4hicPnghuA5Ro77NHwpgEyXL2')
              AdminPanelLayout(),
          ],
        ),
      ),
    );
  }
}

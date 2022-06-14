import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/account_pic_layout.dart';
import 'package:flutter/material.dart';

class AccountPicPage extends StatelessWidget {
  const AccountPicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            AccountPicLayout(),
          ],
        ),
      ),
    );
  }
}

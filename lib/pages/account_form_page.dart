import 'package:baraton_stores/layouts/account_info_layout.dart';
import 'package:baraton_stores/layouts/add_account_info_form.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AccountFormPage extends StatelessWidget {
  const AccountFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kgreytext),
        backgroundColor: kpagewhite,
        elevation: 0,
      ),
      backgroundColor: kpagewhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            AddAccountInfoForm(),
          ],
        ),
      ),
    );
  }
}

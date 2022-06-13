import 'package:flutter/material.dart';

import '../constants/text.dart';

class AccountInfoCard extends StatelessWidget {
  const AccountInfoCard({
    Key? key,
    // required this.ontap,
    required this.titletext,
    required this.subtext,
    required this.trailingtext,
  }) : super(key: key);

  //final VoidCallback ontap;
  final String titletext;
  final String subtext;
  final String trailingtext;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          titletext,
          style: tcartegoriestext,
        ),
        subtitle: Text(
          subtext,
          style: tcapacity,
        ),
        trailing: Text(
          trailingtext,
          style: tdeliverytext,
        ),
      ),
    );
  }
}

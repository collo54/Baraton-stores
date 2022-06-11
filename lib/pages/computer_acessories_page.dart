import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/computer_acessories_layout.dart';
import 'package:flutter/material.dart';

class ComputerAcessoriesPage extends StatelessWidget {
  const ComputerAcessoriesPage({Key? key}) : super(key: key);

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
            ComputerAcessoriesLayout(),
          ],
        ),
      ),
    );
  }
}

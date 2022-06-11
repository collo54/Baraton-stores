import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/layouts/cartegories_layout.dart';
import 'package:flutter/material.dart';

class CartegoriesPage extends StatelessWidget {
  const CartegoriesPage({Key? key}) : super(key: key);

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
            CartegoriesLayout(),
          ],
        ),
      ),
    );
  }
}

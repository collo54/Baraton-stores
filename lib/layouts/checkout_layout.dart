import 'dart:core';
import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/widgets/checkout_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/checkout_product.dart';
import '../models/product_model.dart';
import '../services/firestore_service.dart';

class CheckoutLayout extends StatefulWidget {
  const CheckoutLayout({Key? key}) : super(key: key);

  @override
  State<CheckoutLayout> createState() => _CheckoutLayoutState();
}

class _CheckoutLayoutState extends State<CheckoutLayout> {
  double? _total;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: const BoxDecoration(
          color: kpagewhite,
        ),
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

  Future<void> _delete(BuildContext context, CheckoutItem checkoutItem) async {
    final database = Provider.of<FirestoreService>(context, listen: false);
    await database.deleteContibutor(checkoutItem);
  }

  Widget _buildMessage(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Checkout',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: StreamBuilder<List<CheckoutItem>>(
            stream: firestoreservice.checkoutItemsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final productdata = snapshot.data!;
                if (productdata.isNotEmpty) {
                  final children = productdata
                      .map(
                        (product) => //Row(
                            //children: [
                            Dismissible(
                          key: Key(UniqueKey().toString()),
                          direction: DismissDirection.down,
                          onDismissed: (direction) => _delete(context, product),
                          child: CheckoutPageCard(
                            image: product.downloadUrl!,
                            product: product.productname!,
                            price: product.price!.toString(),
                          ),
                        ),
                        // ],
                        // ),
                      )
                      .toList();

                  final List<double> total = productdata
                      .map(
                        (product) => product.price!,
                      )
                      .toList();

                  double _sumall(List<double> arr) {
                    double _sum = 0;
                    for (final item in arr) {
                      _sum += item;
                    }
                    return _sum;
                  }

                  //  _sumall(total);

                  return Column(
                    children: [
                      Container(
                        height: 310,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: children,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ListTile(
                        leading: Text(
                          'Total',
                          style: tcartegoriestext,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            _sumall(total).toString(),
                            style: tcapacity,
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            'Enter a promo code',
                            style: tpromo,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: kgreytext,
                        endIndent: 10,
                        indent: 10,
                      ),
                    ],
                  );
                }
                return Row(
                  children: [
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Text(
                                '',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text('')
                            ],
                          ),
                          const Text(
                            '',
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Center(child: Text('error occurred'));
              }
              return const Center(child: CircularProgressIndicator());
            },
          ), //StreamBuilder(builder: builder),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildDetails(context),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: _buildAddCartButton(context),
        ),
        const SizedBox(
          height: 70,
        ),
      ],
    );
  }

  //fix navigation
  _buildAddCartButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MaterialButton(
          // minWidth: 200,
          color: kcartbutton,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(1.0))),
          onPressed: () {
            _gotohomepage(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              "push to stk",
              style: GoogleFonts.abhayaLibre(
                textStyle: const TextStyle(
                  height: 1.2,
                  color: kwhite,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildAddItem(BuildContext context) {
    return Container(
      height: 320,
      color: kpagewhite,
      child: ListView(
        padding: const EdgeInsets.all(15),
        scrollDirection: Axis.horizontal,
        children: const [
          CheckoutPageCard(
            image: 'assets/images/iphone.png',
            product: 'Iphone 11 pro max',
            price: 'KES 90,500',
          ),
          CheckoutPageCard(
            image: 'assets/images/googlehomemini.png',
            product: 'Google home mini',
            price: 'KES 70,500',
          ),
          CheckoutPageCard(
            image: 'assets/images/cableusb.png',
            product: 'Charging cable',
            price: 'KES 5,500',
          ),
        ],
      ),
    );
  }

  _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: Text(
            'Delivery',
            style: tcartegoriestext,
          ),
          title: Text(
            'Kasarani Nairobi',
            style: tcapacity,
          ),
          subtitle: Text(
            'Fast delivery: 6/12/22',
            style: tdeliverytext,
          ),
        ),
        const Divider(
          thickness: 0.2,
          color: kgreytext,
          endIndent: 10,
          indent: 10,
        ),
        const SizedBox(height: 5),
        ListTile(
          leading: Text(
            'Payment',
            style: tcartegoriestext,
          ),
          title: Text(
            'PAYBILL ****',
            style: tcapacity,
          ),
          subtitle: Text(
            'ACCOUNT NAME ****',
            style: tdeliverytext,
          ),
        ),
        const Divider(
          thickness: 0.2,
          color: kgreytext,
          endIndent: 10,
          indent: 10,
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  _gotohomepage(BuildContext context) {
    /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TabHomePage()),
    );*/
  }
}

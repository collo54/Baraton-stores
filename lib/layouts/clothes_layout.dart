import 'package:baraton_stores/constants/colors.dart';
import 'package:baraton_stores/constants/text.dart';
import 'package:baraton_stores/models/product_model.dart';
import 'package:baraton_stores/pages/onboarding_page_four.dart';
import 'package:baraton_stores/widgets/acessories_card.dart';
import 'package:baraton_stores/widgets/checkout_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/checkout_product.dart';
import '../services/firestore_service.dart';
import '../widgets/other_acessories_card.dart';

class ClothesLayout extends StatefulWidget {
  const ClothesLayout({Key? key, this.checkoutItem}) : super(key: key);
  final CheckoutItem? checkoutItem;

  /* static Widget create(BuildContext context) {
    return Provider<CheckoutBloc>(
      create: (_) => CheckoutBloc(),
      child: const ComputerAcessoriesLayout(),
    );
  }*/

  @override
  State<ClothesLayout> createState() => _ClothesLayoutState();
}

class _ClothesLayoutState extends State<ClothesLayout> {
  //late List<CheckoutPageCard> _list;
  late String _productnamevariable;
  late String _pricevariable;
  late String _imagevariable;

  // StreamController<List> eventController = StreamController<List>.broadcast();

  CheckoutPageCard values() {
    return CheckoutPageCard(
        image: _imagevariable,
        product: _productnamevariable,
        price: _pricevariable);
    //_imagevariable $_pricevariable
    // _productnamevariable;
  }

  List<String> valueb() {
    return [_productnamevariable, _pricevariable, _imagevariable];
  }

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

  Widget _buildMessage(BuildContext context) {
    final firestoreservice =
        Provider.of<FirestoreService>(context, listen: false);
    //final user = Provider.of<UserModel>(context);
    //final bloc = Provider.of<CheckoutBloc>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Clothes and acessories',
            style: theadlinetext,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: StreamBuilder<List<ProductItem>>(
            stream: firestoreservice.productItemStream3(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final productdata = snapshot.data!;
                if (productdata.isNotEmpty) {
                  final children = productdata
                      .map(
                        (product) => //Row(
                            //children: [
                            GestureDetector(
                          onTap: () async {
                            /* setState(() {
                              /*  List<CheckoutPageCard> list = <CheckoutPageCard>[
                                CheckoutPageCard(
                                    image: 'assets/images/iphone.png',
                                    product: product.productname!,
                                    price: product.price!)
                              ];
                              _list = list;*/
                              _imagevariable = 'assets/images/iphone.png';
                              _pricevariable = product.price!;
                              _productnamevariable = product.productname!;
                            });*/

                            final userId =
                                FirebaseAuth.instance.currentUser!.uid;
                            //final timeStamp = DateTime.now().millisecondsSinceEpoch;
                            final id = widget.checkoutItem?.id ??
                                documentIdFromCurrentDate();
                            final time = DateTime.now().toIso8601String();
                            final item = CheckoutItem(
                              downloadUrl: product.downloadUrl,
                              id: id,
                              price: product.price!,
                              productname: product.productname!,
                              timeStamp: time,
                              userId: userId,
                            );
                            final firestoreservice =
                                Provider.of<FirestoreService>(context,
                                    listen: false);
                            await firestoreservice.setCheckoutItem(item);
                          },
                          child: OtherAccessoriesCard(
                            widget: product.downloadUrl != null
                                ? Image.network(
                                    product.downloadUrl!,
                                    height: 69,
                                    width: 119,
                                  )
                                : Image.asset(
                                    'assets/images/iphone.png',
                                    height: 69,
                                    width: 119,
                                  ),
                            product: product.productname!,
                            price: product.price!.toString(),
                          ),
                          /*AcessoriesPageCard(
                            image: 'assets/images/iphone.png',
                            product: product.productname!,
                            price: product.price!,
                          ),*/
                        ),
                        // ],
                        // ),
                      )
                      .toList();
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(5),
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      crossAxisCount: 2,
                      children: children,
                    ),
                  ); /*ListView.separated(
                      
                      separatorBuilder:( context, index) => Divider()  ,
                      itemCount: 1,
                      itemBuilder: ( context, index) => ListTile(),
                      );*/
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
          height: 5,
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  _buildItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/iphone.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Card(
                child: Container(
                  color: kwhite,
                  height: 150,
                  width: 167,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/laptop3.png',
                        height: 69,
                        width: 119,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Surface laptop 3',
                        style: tlaptopacessoriesname,
                      ),
                      Text(
                        'kES 99999',
                        style: taccessoriesprice,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _gotoAutheticationpage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnboardingPageFour()),
    );
  }
}

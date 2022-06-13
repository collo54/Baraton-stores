import 'dart:async';

import 'package:baraton_stores/models/model_checkout.dart';

import '../widgets/checkout_card.dart';

class CheckoutBloc {
  final StreamController<ModelCheckout> _checkoutController =
      StreamController<ModelCheckout>();

  Stream<ModelCheckout> get checkoutStream => _checkoutController.stream;

  //represent latest values added to stream
  ModelCheckout _modelCheckout = ModelCheckout();

  void dispose() {
    _checkoutController.close();
  }

  /*Future<CheckoutPageCard> values() async {
    return CheckoutPageCard(
        image: _modelCheckout.imagevariable,
        product: _modelCheckout.productnamevariable,
        price: _modelCheckout.pricevariable);
    //_imagevariable $_pricevariable
    // _productnamevariable;
  }*/

  Future<List> valueb() async {
    return [
      _modelCheckout.imagevariable,
      _modelCheckout.productnamevariable,
      _modelCheckout.pricevariable,
    ];
  }

  void updateWith({
    String? productnamevariable,
    String? pricevariable,
    String? imagevariable,
  }) {
    _modelCheckout = _modelCheckout.copyWith(
      productnamevariable: productnamevariable,
      pricevariable: pricevariable,
      imagevariable: imagevariable,
    );
    _checkoutController.add(_modelCheckout);
  }

  /* void setIsLoading(ModelCheckout pageCard) =>
      _checkoutController.add(pageCard);*/
}

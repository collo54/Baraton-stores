import 'dart:async';

import 'package:baraton_stores/widgets/checkout_card.dart';

class CheckoutBloc {
  final StreamController<List<CheckoutPageCard>> _checkoutController =
      StreamController<List<CheckoutPageCard>>();

  Stream<List<CheckoutPageCard>> get checkoutStream =>
      _checkoutController.stream;

  void dispose() {
    _checkoutController.close();
  }

  void setIsLoading(List<CheckoutPageCard> pageCard) =>
      _checkoutController.add(pageCard);
}

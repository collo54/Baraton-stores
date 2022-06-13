class ModelCheckout {
  final String productnamevariable;
  final String pricevariable;
  final String imagevariable;

  ModelCheckout(
      {this.productnamevariable = '',
      this.pricevariable = '',
      this.imagevariable = ''});

  ModelCheckout copyWith({
    String? productnamevariable,
    String? pricevariable,
    String? imagevariable,
  }) {
    return ModelCheckout(
      productnamevariable: productnamevariable ?? this.productnamevariable,
      pricevariable: pricevariable ?? this.pricevariable,
      imagevariable: imagevariable ?? this.imagevariable,
    );
  }
}

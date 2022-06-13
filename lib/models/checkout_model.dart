class CheckoutModel {
  CheckoutModel(
      {this.productname, this.price, this.promocode, this.downloadUrl});
  final String? productname;
  final String? price;
  final String? downloadUrl;
  final String? promocode;

  factory CheckoutModel.fromMap(Map<String, dynamic> data) {
    final String? price = data['price'];
    final String? productname = data['productname'];
    final String? downloadUrl = data['downloadUrl'];
    final String? promocode = data['promocode'];

    return CheckoutModel(
      promocode: promocode,
      price: price,
      productname: productname,
      downloadUrl: downloadUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
      'price': price,
      'productname': productname,
      'promocode': promocode,
    };
  }
}

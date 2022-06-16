class NewProductItem {
  NewProductItem(
      {this.productname,
      this.timeStamp,
      this.price,
      required this.id,
      this.verify,
      this.userId,
      this.promocode,
      this.downloadUrl});
  final String? productname;
  final String? timeStamp;
  final double? price;
  final String? userId;
  final String? downloadUrl;
  final String? promocode;
  final String id;
  final bool? verify;

  factory NewProductItem.fromMap(Map<String, dynamic> data, String id) {
    final double? price = data['price'];
    final String? timeStamp = data['timeStamp'];
    final String? userId = data['userId'];
    final String? productname = data['productname'];
    final String? downloadUrl = data['downloadUrl'];
    final String? promocode = data['promocode'];
    final bool? verify = data['verify'];
    return NewProductItem(
      id: id,
      promocode: promocode,
      price: price,
      productname: productname,
      timeStamp: timeStamp,
      userId: userId!,
      downloadUrl: downloadUrl,
      verify: verify,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'downloadUrl': downloadUrl,
      'price': price,
      'userId': userId,
      'productname': productname,
      'timeStamp': timeStamp,
      'promocode': promocode,
      'verify': verify,
    };
  }
}

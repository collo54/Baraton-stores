class CheckoutItem {
  CheckoutItem(
      {this.productname,
      this.timeStamp,
      this.price,
      required this.id,
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

  factory CheckoutItem.fromMap(Map<String, dynamic> data, String id) {
    final double? price = data['price'];
    final String? timeStamp = data['timeStamp'];
    final String? userId = data['userId'];
    final String? productname = data['productname'];
    final String? downloadUrl = data['downloadUrl'];
    final String? promocode = data['promocode'];

    return CheckoutItem(
      id: id,
      promocode: promocode,
      price: price,
      productname: productname,
      timeStamp: timeStamp,
      userId: userId!,
      downloadUrl: downloadUrl,
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
    };
  }
}

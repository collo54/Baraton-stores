class DocumentPath {
  static String productcheckout(String uid, String productId) =>
      'Buyers/$uid/checkouts/$productId';
  static String checkout(String uid) => 'Buyers/$uid/checkouts/';
}

class DocumentPath {
  static String cartegoty(String cartegoryid, String productid) =>
      'cartegories/$cartegoryid/$productid';
  static String vendor(String vendorid) => 'Vendors/$vendorid';
  static String avatar(String uid) => 'avatar/$uid';
  static String contributor(String uid, String contributorId) =>
      'users/$uid/contributors/$contributorId';
  static String contributors(String uid) => 'users/$uid/contributors/';
}

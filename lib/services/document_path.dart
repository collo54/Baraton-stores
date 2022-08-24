class DocumentPath {
  static String productcheckout(String uid, String productId) =>
      'Buyers/$uid/checkouts/$productId';
  static String checkout(String uid) => 'Buyers/$uid/checkouts/';

  static String newproduct(String newproductId) => 'Apliances/$newproductId';
  static String streamproduct() => 'Apliances/';

  static String newAllProduct(String newAllProductId) =>
      'All Products/$newAllProductId';
  static String streamAllProduct() => 'All Products/';

  static String newComputer(String newComputerId) => 'Computers/$newComputerId';
  static String streamComputer() => 'Computers/';

  static String newBeautyProduct(String newBeautyProductId) =>
      'Beauty Products/$newBeautyProductId';
  static String streamBeautyProduct() => 'Beauty Products/';

  static String newPhones(String newPhonesId) =>
      'phones and acessories/$newPhonesId';
  static String streamPhones() => 'phones and acessories/';

  static String newClothes(String newClothesId) => 'Clothes/$newClothesId';
  static String streamClothes() => 'Clothes/';

  static String newHouseholdProduct(String newHouseholdProductId) =>
      'Household Items/$newHouseholdProductId';
  static String streamHouseholdProduct() => 'Household Items/';
}

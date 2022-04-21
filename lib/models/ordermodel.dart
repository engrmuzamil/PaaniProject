class OrderModel {
  final String orderID;
  final String paymentMethod;
  final String address;
  final int totalAmount;
  final String mobileNumber;
  final String name;

  OrderModel({
    required this.orderID,
    required this.paymentMethod,
    required this.address,
    required this.totalAmount,
    required this.mobileNumber,
    required this.name,
  });
}

class OrderDetailModel {
  String productImage;
  String productName;
  int productPrice;
  String productId;
  int productQuantity;
  OrderDetailModel(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productId});
}

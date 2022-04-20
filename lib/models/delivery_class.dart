class DeliveryAddressModel {
  final String firstName;
  final String lastName;
  final String mobileNo;
  final String alternateMobileNo;
  final String society;
  final String street;
  final String landmark;
  final String city;
  final String area;
  final String pincode;
  final String addressType;
  final double latitude;
  final double longitude;

  DeliveryAddressModel(
      {required this.firstName,
      required this.lastName,
      required this.mobileNo,
      required this.alternateMobileNo,
      required this.society,
      required this.street,
      required this.landmark,
      required this.city,
      required this.area,
      required this.pincode,
      required this.addressType,
      required this.latitude,
      required this.longitude});
}

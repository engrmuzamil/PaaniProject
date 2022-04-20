import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  final int totalPrice;
  const MyGooglePay({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<MyGooglePay> createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {


// In your Widget build() method

// In your Stateless Widget class or State
  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server or PSP
  }
  @override
  Widget build(BuildContext context) {
      var paymentItems = [
      PaymentItem(
        label: 'Total',
        amount: '${widget.totalPrice}',
        status: PaymentItemStatus.final_price,
      )
    ];
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: paymentItems,
      style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}

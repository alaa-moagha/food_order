import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_order/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

import '../../shared/utils.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(
              "Sub Total: ${cartService.subTotal.value}",
              style: TextStyle(fontSize: screenWidth(20)),
            ),
            SizedBox(
              height: screenWidth(50),
            ),
            Text(
              "Tax: ${cartService.tax.value}",
              style: TextStyle(fontSize: screenWidth(20)),
            ),
            SizedBox(
              height: screenWidth(50),
            ),
            Text(
              "Delivery Fees: ${cartService.delivery.value}",
              style: TextStyle(fontSize: screenWidth(20)),
            ),
            SizedBox(
              height: screenWidth(50),
            ),
            Text(
              "Total: ${cartService.total.value}",
              style: TextStyle(fontSize: screenWidth(20)),
            ),
            CustomButton(
                text: "Continue Shopping",
                onPressed: () {
                  cartService.clearCart();
                  Get.off(MainView());
                })
          ],
        ),
      ),
    );
  }
}

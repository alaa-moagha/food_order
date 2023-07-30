import 'package:flutter/material.dart';
import 'package:food_order/ui/shared/custom_widgets/custom_button.dart';
import 'package:food_order/ui/views/cart_view/cart_controller.dart';
import 'package:get/get.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Obx(() {
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: controller.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.removeFromCart(controller.cartList[index]);
                        },
                        icon: Icon(Icons.delete)),
                    Column(
                      children: [
                        Text(
                          controller.cartList[index].mealModel?.name ?? '',
                          style: TextStyle(fontSize: screenWidth(10)),
                        ),
                        Text(
                          controller.cartList[index].mealModel!.price
                              .toString(),
                          style: TextStyle(fontSize: screenWidth(10)),
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              child: Text("-"),
                              onPressed: () {
                                controller.changeCount(
                                    false, controller.cartList[index]);
                              },
                            ),
                            Text(
                              controller.cartList[index].count.toString(),
                              style: TextStyle(fontSize: screenWidth(10)),
                            ),
                            ElevatedButton(
                              child: Text("+"),
                              onPressed: () {
                                controller.changeCount(
                                    true, controller.cartList[index]);
                              },
                            ),
                          ],
                        ),
                        Text(
                          controller.cartList[index].total.toString(),
                          style: TextStyle(fontSize: screenWidth(10)),
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: screenWidth(1),
                  height: 2,
                  color: AppColors.mainOrangeColor,
                );
              },
            ),
          ),
          Container(
            width: screenWidth(1.05),
            decoration: BoxDecoration(
                color: AppColors.mainGreyColor,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(screenWidth(65)),
              child: Column(
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
                      text: "Checkout",
                      onPressed: () {
                        controller.checkout();
                      }),
                  IconButton(
                    onPressed: () {
                      controller.clearCart();
                    },
                    icon: Icon(Icons.clear_all),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    })));
  }
}






















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../shared/colors.dart';
// import '../../shared/custom_widgets/custom_button.dart';
// import '../../shared/utils.dart';
// import 'cart_controller.dart';

// class CartView extends StatefulWidget {
//   CartView({Key? key}) : super(key: key);

//   @override
//   State<CartView> createState() => _CartViewState();
// }

// class _CartViewState extends State<CartView> {
//   CartController controller = Get.put(CartController());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(child: Scaffold(body: Obx(() {
//       return Column(
//         children: [
//           Expanded(
//             child: ListView.separated(
//               shrinkWrap: true,
//               itemCount: controller.cartList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           controller.removeFromCart(controller.cartList[index]);
//                         },
//                         icon: Icon(Icons.delete)),
//                     Column(
//                       children: [
//                         Text(
//                           controller.cartList[index].mealModel?.name ?? '',
//                           style: TextStyle(fontSize: screenWidth(10)),
//                         ),
//                         Text(
//                           controller.cartList[index].mealModel!.price
//                               .toString(),
//                           style: TextStyle(fontSize: screenWidth(10)),
//                         ),
//                         Row(
//                           children: [
//                             ElevatedButton(
//                               child: Text('-'),
//                               onPressed: () {
//                                 controller.changeCount(
//                                     false, controller.cartList[index]);
//                               },
//                             ),
//                             Text(
//                               controller.cartList[index].count.toString(),
//                               style: TextStyle(fontSize: screenWidth(10)),
//                             ),
//                             ElevatedButton(
//                               child: Text('+'),
//                               onPressed: () {
//                                 controller.changeCount(
//                                     true, controller.cartList[index]);
//                               },
//                             ),
//                           ],
//                         ),
//                         Text(
//                           controller.cartList[index].total.toString(),
//                           style: TextStyle(fontSize: screenWidth(10)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return Container(
//                   width: screenWidth(1),
//                   height: 2,
//                   color: AppColors.mainOrangeColor,
//                 );
//               },
//             ),
//           ),
//           Container(
//             width: screenWidth(1.05),
//             decoration: BoxDecoration(
//                 color: AppColors.mainGreyColor,
//                 borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: EdgeInsets.all(screenWidth(65)),
//               child: Column(
//                 children: [
//                   Text(
//                     "Sub Total: ${controller.calcTotals()["sub-total"]}",
//                     style: TextStyle(fontSize: screenWidth(20)),
//                   ),
//                   SizedBox(
//                     height: screenWidth(50),
//                   ),
//                   Text(
//                     "Tax: ${controller.calcTotals()["tax"]}",
//                     style: TextStyle(fontSize: screenWidth(20)),
//                   ),
//                   SizedBox(
//                     height: screenWidth(50),
//                   ),
//                   Text(
//                     "Delivery Fees: ${controller.calcTotals()["delivery"]}",
//                     style: TextStyle(fontSize: screenWidth(20)),
//                   ),
//                   SizedBox(
//                     height: screenWidth(50),
//                   ),
//                   Text(
//                     "Total: ${controller.calcTotals()["total"]}",
//                     style: TextStyle(fontSize: screenWidth(20)),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       );
//     })));
//   }
// }

import 'package:flutter/material.dart';
import 'package:food_order/ui/views/meal_details/meal_details_controller.dart';
import 'package:get/get.dart';
import '../../../core/data/models/apis/meal_models.dart';
import '../../shared/colors.dart';
import '../../shared/utils.dart';

class MealDetailsView extends StatefulWidget {
  final MealModel model;
  MealDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  late MealDetailsController controller;
  @override
  void initState() {
    controller = Get.put(MealDetailsController(widget.model));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text(
            'Price: ${widget.model.price}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Obx(() {
            return Row(
              children: [
                ElevatedButton(
                  child: Text("+"),
                  onPressed: () {
                    controller.changeCount(true);
                  },
                ),
                ElevatedButton(
                  child: Text(controller.count.value.toString()),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text('-'),
                  onPressed: controller.count.value == 1
                      ? null
                      : () {
                          controller.changeCount(false);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: controller.count.value == 1
                        ? AppColors.mainTextColor
                        : AppColors.mainOrangeColor,
                  ),
                ),
              ],
            );
          }),
          Obx(() {
            return Text(
              controller.calcTotal().toString(),
              style: TextStyle(fontSize: screenWidth(10)),
            );
          }),
          ElevatedButton(
            child: Text('add'),
            onPressed: () {
              controller.addToCart();
            },
          )
        ],
      )),
    );
  }
}




















// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:food_order/core/data/models/apis/meal_models.dart';
// import 'package:food_order/core/translation/app_translation.dart';
// import 'package:food_order/ui/shared/colors.dart';
// import 'package:food_order/ui/shared/utils.dart';
// import 'package:food_order/ui/views/cart_view/cart_view.dart';
// import 'package:food_order/ui/views/meal_details/meal_details_controller.dart';
// import 'package:get/get.dart';
// import '../../shared/custom_widgets/custom_button.dart';

// class MealDetailsView extends StatefulWidget {
//   final MealModel meal;
//   const MealDetailsView({super.key, required this.meal});

//   @override
//   State<MealDetailsView> createState() => _MealDetailsViewState();
// }

// class _MealDetailsViewState extends State<MealDetailsView> {
//   late MealDetailsController controller;
//   @override
//   void initState() {
//     super.initState();
//     controller = Get.put(MealDetailsController(widget.meal));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Obx(
//           () => Column(
//             children: [
//               CachedNetworkImage(
//                 imageUrl: 'http://via.placeholder.com/350x150',
//               ),
//               SizedBox(
//                 height: screenWidth(20),
//               ),
//               Text(
//                 widget.meal.name ?? '',
//                 style: TextStyle(fontSize: screenWidth(20)),
//               ),
//               SizedBox(
//                 height: screenWidth(20),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     child: Text('+'),
//                     onPressed: () {
//                       controller.changeCount(true);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.mainOrangeColor,
//                     ),
//                   ),
//                   Container(
//                     width: 50,
//                     child: Text(
//                       controller.count.value.toString(),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   ElevatedButton(
//                     child: Text('-'),
//                     onPressed: () {
//                       controller.changeCount(false);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: controller.count.value == 1
//                           ? AppColors.mainTextColor
//                           : AppColors.mainOrangeColor,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: screenWidth(15),
//               ),
//               Container(
//                 width: screenWidth(5),
//                 height: screenWidth(5),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.mainTextColor),
//                     color: AppColors.mainWhiteColor),
//                 child: Text(
//                   controller.calcMealTotal().toString(),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               CustomButton(
//                   text: tr('add_to_cart'),
//                   onPressed: () {
//                     controller.addToCart();
//                     Get.to(CartView());
//                   }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

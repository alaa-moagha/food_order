import 'package:get/get.dart';
import '../../../core/data/models/apis/meal_models.dart';
import '../../../core/services/base_controller.dart';
import '../../shared/utils.dart';
import '../cart_view/cart_view.dart';

class MealDetailsController extends BaseController {
  MealDetailsController(MealModel mealModel) {
    model = mealModel;
  }

  MealModel model = MealModel();
  RxInt count = 1.obs;

  void changeCount(bool incress) {
    if (incress)
      count++;
    else {
      if (count > 1) count--;
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  void addToCart() {
    cartService.addToCart(
        model: model,
        count: count.value,
        afterAdd: () {
          Get.to(() => CartView());
        });
  }
}
















// import 'package:food_order/core/services/base_controller.dart';
// import 'package:food_order/core/services/cart_service.dart';
// import 'package:get/get.dart';
// import '../../../core/data/models/apis/meal_models.dart';
// import '../../../core/data/models/cart_model.dart';
// import '../../shared/utils.dart';

// class MealDetailsController extends BaseController {
//   RxInt count = 1.obs;
//   MealModel meal;

//   MealDetailsController(this.meal);

//   int changeCount(bool increase) =>
//       increase ? count.value++ : (count.value > 1 ? count.value-- : 1);

//   double calcMealTotal() => count.value * (meal.price ?? 0).toDouble();

//   // void addingToCart() {
//   //   cartService.addToCart(
//   //       count: count.value, mealTotal: calculateMealTotal(), meal: meal);
//   // }
//   void addToCart() {
//     List<CartModel> list = storage.getCartList();

//     CartModel result = list.firstWhere(
//       (element) => element.mealModel!.id == meal.id,
//       orElse: () => CartModel(),
//     );

//     if (result.mealModel != null) {
//       int index = list.indexOf(result);
//       list[index].count = list[index].count! + count.value;
//       list[index].total = list[index].total! + calcMealTotal();
//     } else {
//       list.add(CartModel(
//           count: count.value, total: calcMealTotal(), mealModel: meal));
//     }

//     storage.setCartList(list);
//   }
// }

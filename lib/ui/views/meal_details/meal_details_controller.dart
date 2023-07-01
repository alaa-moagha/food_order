import 'package:food_order/core/services/base_controller.dart';
import 'package:get/get.dart';
import '../../../core/data/models/apis/meal_models.dart';

class MealDetailsController extends BaseController {
  RxInt count = 1.obs;
  MealModel meal;

  MealDetailsController(this.meal);

  int changeCount(bool increase) {
    return increase ? count.value++ : (count.value > 1 ? count.value-- : 1);
  }

  double total() {
    return count.value * (meal.price ?? 0).toDouble();
  }

  void addToCart() {}
}

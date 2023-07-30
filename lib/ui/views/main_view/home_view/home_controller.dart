import 'package:get/get.dart';
import '../../../../core/data/models/apis/category_model.dart';
import '../../../../core/data/models/apis/meal_models.dart';
import '../../../../core/data/repositories/category_repository.dart';
import '../../../../core/data/repositories/meal_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/enums/operation_type.dart';
import '../../../../core/enums/request_status.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
import '../../../shared/utils.dart';

class HomeController extends BaseController {
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;

  bool get isCategoryLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType.contains(OperationType.CATEGORY);

  bool get isMealLoading =>
      requestStatus.value == RequestStatus.LOADING &&
      operationType.contains(OperationType.MEAL);

  @override
  void onInit() async {
    await getAllGategory();
    await getAllMeal();
    // cartCount.value = cartService.getCartCount();
    super.onInit();
  }

  Future<void> getAllGategory() async {
    await runLoadingFutureFunction(
      type: OperationType.CATEGORY,
      function: CategoryRepository().getAll().then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          categoryList.addAll(r);
        });
      }),
    );
  }

  Future<void> getAllMeal() async {
    await runLoadingFutureFunction(
        type: OperationType.MEAL,
        function: MealRepository().getAll().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            mealList.addAll(r);
          });
        }));
  }

  RxInt getCartCount() {
    return cartService.cartCount;
  }

  void addToCart(MealModel model) {
    cartService.addToCart(
        model: model,
        count: 1,
        afterAdd: () {
          // cartCount.value += 1;
          CustomToast.showMessage(
              message: 'Added', messageType: MessageType.SUCCESS);
        });
  }
}






















// import 'package:food_order/core/data/repositories/category_repository.dart';
// import 'package:food_order/core/data/repositories/meal_repository.dart';
// import 'package:food_order/core/enums/message_type.dart';
// import 'package:food_order/core/services/base_controller.dart';
// import 'package:food_order/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:get/get.dart';
// import '../../../../core/data/models/apis/category_model.dart';
// import '../../../../core/data/models/apis/meal_models.dart';
// import '../../../../core/enums/operation_type.dart';
// import '../../../../core/enums/request_status.dart';

// class HomeController extends BaseController {
//   RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
//   RxList<MealModel> mealList = <MealModel>[].obs;
//   Rx<RequestStatus> requestStatus = RequestStatus.DEFAULT.obs;

//   bool get isCategoryLoading =>
//       requestStatus.value == RequestStatus.LOADING &&
//       operationType.contains(OperationType.CATEGORY);

//   bool get isMealLoading =>
//       requestStatus.value == RequestStatus.LOADING &&
//       operationType.contains(OperationType.MEAL);

//   Future<void> onInit() async {
//     getAllCategory();
//     getAllMeal();
//     super.onInit();
//   }

//   void getAllCategory() {
//     runLoadingFutureFunction(
//         type: OperationType.CATEGORY,
//         function: CategoryRepository().getAll().then((value) {
//           value.fold((l) {
//             CustomToast.showMessage(
//                 message: l, messageType: MessageType.REJECTED);
//           }, (r) {
//             categoryList.addAll(r);
//           });
//         }));
//   }

//   void getAllMeal() {
//     runLoadingFutureFunction(
//         type: OperationType.MEAL,
//         function: MealRepository().getAll().then((value) {
//           value.fold((l) {
//             CustomToast.showMessage(
//                 message: l, messageType: MessageType.REJECTED);
//           }, (r) {
//             mealList.addAll(r);
//           });
//         }));
//   }
// }

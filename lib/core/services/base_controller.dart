import 'package:bot_toast/bot_toast.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:get/get.dart';
import '../enums/operation_type.dart';
import '../enums/request_status.dart';

class BaseController extends GetxController {
  Rx<RequestStatus> requestStatus = RequestStatus.DEFAULT.obs;
  RxList<OperationType> operationType = <OperationType>[].obs;

  Future runFutureFunction({required Future function}) async {
    return await function;
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    requestStatus.value = RequestStatus.LOADING;
    operationType.add(type!);
    await function;
    requestStatus.value = RequestStatus.DEFAULT;
    operationType.remove(type);
  }
}

Future runFullLoadingFutureFunction({
  required Future function,
}) async {
  customLoader();
  await function;
  BotToast.closeAllLoading();
}

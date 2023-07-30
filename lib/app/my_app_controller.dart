import 'package:food_order/core/enums/connectivity_status.dart';
import 'package:food_order/core/services/base_controller.dart';
import 'package:food_order/core/services/connectivity_service.dart';

import '../ui/shared/utils.dart';

class MyAppController extends BaseController {
  ConnectivityService service = ConnectivityService();
  ConnectivityStatus connectionStatus = ConnectivityStatus.ONLINE;
  @override
  void onInit() {
    listenToConnectionStatus();
    super.onInit();
  }

  void listenToConnectionStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      connectionStatus = event;
    });
  }
}

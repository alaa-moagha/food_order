import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_order/app/my_app_controller.dart';
import 'package:food_order/core/enums/connectivity_status.dart';
import 'package:food_order/core/services/connectivity_service.dart';
import 'package:food_order/ui/shared/utils.dart';
import 'package:food_order/ui/views/splash_screen/splash_screen_view.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../core/translation/app_translation.dart';
import '../ui/views/map_view/map_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      initialData: ConnectivityStatus.ONLINE,
      child: GetMaterialApp(
        // enableLog: false, // to disable Get logs
        // defaultTransition:Get.isAndroid? Transition.fadeIn : Transition.cupertino, // for navigation's animation
        // transitionDuration: Duration(milliseconds: 300),
        translations: AppTranslation(),
        locale: getLocal(),
        fallbackLocale: getLocal(),
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenView(),
      ),
    );
  }
}

Locale getLocal() {
  if (storage.getAppLanguage() == "ar") {
    return Locale("ar", "SA");
  } else if (storage.getAppLanguage() == "en") {
    return Locale("en", "US");
  } else {
    return Locale("tr", "TR");
  }
}

import 'package:flutter/material.dart';
import 'package:food_order/core/data/repositories/shared_preference_repository.dart';
import 'package:food_order/core/services/cart_service.dart';
import 'package:food_order/core/services/location_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';
import 'app/my_app_controller.dart';
import 'core/services/connectivity_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// SharedPreferences? globalSharedprefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () async {
      var sharedPref = await SharedPreferences.getInstance();
      return sharedPref;
    },
  );
  Get.put(SharedPreferenceRepository());
  Get.put(CartService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  Get.put(LocationService());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

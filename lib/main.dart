import 'package:flutter/material.dart';
import 'package:food_order/core/data/repositories/shared_preference_repository.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/my_app.dart';

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
  runApp(MyApp());
}

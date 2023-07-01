import 'dart:convert';
import 'package:food_order/core/enums/data_type.dart';
import 'package:food_order/core/translation/app_translation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/apis/token_info.dart';
import '../models/cart_model.dart';

class SharedPreferenceRepository {
  SharedPreferences globalSharedPrefs = Get.find();
  // Constants representing preference keys
  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_IS_LOGINED = 'is_logined';
  String PREF_APP_LANG = 'app_language';
  String PREF_CART_LIST = '';

  setFirstLaunch(bool value) {
    setPreference(dataType: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  // default value, in case it doesn't exist
  bool getFirstLaunch() {
    if (globalSharedPrefs.containsKey(PREF_FIRST_LUNCH))
      return getPreference(key: PREF_FIRST_LUNCH);
    else
      return true;
  }

  setIsLogined(bool value) {
    setPreference(dataType: DataType.BOOL, key: PREF_IS_LOGINED, value: value);
  }

  bool getIsLogined() {
    if (globalSharedPrefs.containsKey(PREF_IS_LOGINED))
      return getPreference(key: PREF_IS_LOGINED);
    else
      return false;
  }

  setAppLanguage(String value) {
    setPreference(dataType: DataType.STRING, key: PREF_APP_LANG, value: value);
  }

  String getAppLanguage() {
    if (langSelected())
      return getPreference(key: PREF_APP_LANG);
    else
      return "en";
  }

  void setCartList(List<CartModel> list) {
    setPreference(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalSharedPrefs.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreference(key: PREF_CART_LIST));
    } else {
      return [];
    }
  }

  bool langSelected() {
    if (globalSharedPrefs.containsKey(PREF_APP_LANG))
      return true;
    else
      return false;
  }

  // Sets the preference based on the specified data type
  // using the globalSharedPrefs instance
  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPrefs.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPrefs.setBool(key, value);
        break;
      case DataType.STRING:
        await globalSharedPrefs.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPrefs.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await globalSharedPrefs.setStringList('items', <String>[key, value]);
        break;
    }
  }

  // Retrieves the preference value using the globalSharedPrefs instance
  dynamic getPreference({required String key}) {
    return globalSharedPrefs.get(key);
  }

  String PREF_TOKEN_INFO = 'token_info';

  setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN_INFO,
      value: jsonEncode(value),
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPrefs.containsKey(PREF_TOKEN_INFO)) {
      return TokenInfo.fromJson(
          jsonDecode(getPreference(key: PREF_TOKEN_INFO)));
    } else {
      return null;
    }
  }
}

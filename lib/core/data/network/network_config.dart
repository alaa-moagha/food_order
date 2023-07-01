import 'package:food_order/core/enums/request_type.dart';
import '../../../ui/shared/utils.dart';
import '../repositories/shared_preference_repository.dart';

class NetworkConfig {
  // we need this for backend versionning 'api/v1/web/' to make it centeralized
  static String BASE_API = 'api/web/';
// UserEndpoints is called in UserRepository, which calls this function = full URL
  static String getFullApiUrl(String api) {
    return BASE_API + api;
  }

  static Map<String, String> getHeaders(
      {bool? needAuth = true,
      RequestType? type = RequestType.POST,
      Map<String, String>? extraHeaders = const {}}) {
    // maps can be treated as functions' bodies, so we can use if and so..
    return {
      'Accept-Language': storage.getAppLanguage(),
      if (needAuth!)
        'Authorization': 'Bearer ${storage.getTokenInfo()?.accessToken ?? ''}',
      if (type == RequestType.POST) 'Content-Type': 'application/json',
      ...extraHeaders!
    };
  }

  // static Map<String, String> getHeaders({
  //   bool? needAuth = true,
  //   RequestType? type = RequestType.POST,
  //   Map<String, String>? extraHeaders = const {},
  // }) {
  //   // maps can betreated as functions bodies, so we can use if and so..
  //   return {
  //     if (needAuth!)
  //       'Authorization':
  //           'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiQ3VzdG9tZXIiLCJuYW1lIjoiMiIsIm5iZiI6MTY4NDA4MTAwMywiZXhwIjoxNjg0NTk5NDAzLCJpYXQiOjE2ODQwODEwMDN9.slCcnvxphIhHNqUmUxJD5Fmx_2pP_iXmoaZqvDXmXtI',
  //     if (type == RequestType.POST) 'Content-Type': 'application/json',
  //     ...extraHeaders!
  //   };
  // }
}

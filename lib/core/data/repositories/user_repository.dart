import 'package:dartz/dartz.dart';
import '../../enums/request_type.dart';
import '../../utils/network_util.dart';
import '../models/apis/token_info.dart';
import '../models/common_response.dart';
import '../network/endpoints/User_endpoints.dart';
import '../network/network_config.dart';

class UserRepository {
  Future<Either<String, TokenInfo>> login({
    required String email, // method's arguments
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST, // enum of request types
        url: UserEndpoints.login, // 'user/login'
        body: {
          'userName': email, // we get keys from API documentation (swagger/pdf)
          'password': password,
        },
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
          //! isn't 'tokenInfo' part of data which is the response from server?
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required int age,
    required String photo,
  }) async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: UserEndpoints.register,
        fields: {
          'Email': email,
          'FirstName': firstname,
          'LastName': lastname,
          'Password': password,
          'Age': age.toString(),
        },
        files: {"Photo": photo},
        headers: NetworkConfig.getHeaders(needAuth: false),
      ).then((response) {
        CommonResponse<Map<String, dynamic>> commonResponse =
            CommonResponse.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(commonResponse.getStatus);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}


  

  // Future<Either<String, TokenInfo>> register({
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     return NetworkUtil.sendRequest(
  //       type: RequestType.POST,
  //       url: UserEndpoints.login,
  //       body: {
  //         'userName': email,
  //         'password': password,
  //       },
  //       headers: NetworkConfig.getHeaders(needAuth: false),
  //     ).then((response) {
  //       CommonResponse<Map<String, dynamic>> commonResponse =
  //           CommonResponse.fromJson(response);

  //       if (commonResponse.getStatus) {
  //         return Right(TokenInfo.fromJson(commonResponse.data ?? {}));
  //       } else {
  //         return Left(commonResponse.message ?? '');
  //       }
  //     });
  //   } catch (e) {
  //     BotToast.showText(text: e.toString());
  //     return Left(e.toString());
  //   }
  // }













// import 'package:dartz/dartz.dart';
// import 'package:food_order/core/data/models/apis/token_info.dart';
// import 'package:food_order/core/data/models/common_response.dart';
// import 'package:food_order/core/data/network/endpoints/user_endpoints.dart';
// import 'package:food_order/core/data/network/network_config.dart';
// import 'package:food_order/core/enums/request_type.dart';
// import 'package:food_order/core/utils/network_util.dart';

// class UserRepository {
//   Future<Either<String, TokenInfo>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       return NetworkUtil.sendRequest(
//           type: RequestType.POST,
//           url: UserEndpoints.login,
//           headers: NetworkConfig.getHeaders(needAuth: false),
//           body: {
//             "userName": email,
//             "password": password,
//           }).then((response) {
//         CommonResponse<Map<String, dynamic>> commonResponse =
//             CommonResponse.fromJson(response);

//         if (commonResponse.getStatus) {
//           return Right(TokenInfo.fromJson(
//             commonResponse.data ?? {},
//           ));
//         } else {
//           return Left(commonResponse.message ?? '');
//         }
//       });
//     } catch (e) {
//       return Left(e.toString());
//     }
//   }
// }

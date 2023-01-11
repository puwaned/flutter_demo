import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:lpt_client/services/dio/dio-service.dart';
import 'package:lpt_client/services/user/user-model.dart';

class UserService extends GetxController {
  final Dio dio;

  UserService({required this.dio});

  Future<User> fetchMe() async {
    var res = await dio.get('/user/me');
    if (res.statusCode == 200) {
      var user = User.fromJson(res.data['data']);
      return user;
    }
    DioService.throwResponse(res);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' as getx;
import 'package:lpt_client/environment.dart';
import 'package:lpt_client/services/app/app-service.dart';
import 'package:lpt_client/services/dio/dio-model.dart';

class DioService extends getx.GetxController {
  final storage = const FlutterSecureStorage();

  Future<String?> getLocalToken() async {
    var localToken = await storage.read(key: 'api-token');
    return localToken;
  }

  QueuedInterceptorsWrapper getInterceptor() {
    return QueuedInterceptorsWrapper(onRequest: (options, handler) async {
      var token = await getLocalToken();
      options.baseUrl = "${Environment.apiUrl}/api";
      options.headers['Content-Type'] = "application/json";
      options.headers['Authorization'] = 'Bearer $token';
      options.responseType = ResponseType.json;
      options.validateStatus =
          (status) => (status ?? 500) < 500 && status != 401;

      return handler.next(options);
    }, onError: (error, handler) async {
      if (error.response != null) {
        return handler.resolve(error.response!);
      }
      return handler.reject(error);
    }, onResponse: (response, handler) {
      return handler.next(response);
    });
  }

  Dio getInstance() {
    var interceptor = getInterceptor();
    var instance = Dio();
    instance.interceptors.add(interceptor);
    return instance;
  }

  static Never throwResponse(Response<dynamic> response) {
    var message = response.data['message'];
    if (message is List) {
      var msg = message.reduce((r, c) => '$r \n$c');
      throw HttpException(msg);
    }
    throw HttpException(message);
  }

  Future<AppResponse> login(Map<String, dynamic> data) async {
    try {
      AppService.setLoading(true);
      var res = await getInstance().post('/auth/login', data: data);
      if (res.statusCode == 200) {
        await storage.write(key: 'api-token', value: res.data['accessToken']);
        // token = res.data['accessToken'];
        return AppResponse(success: true);
      }
      throwResponse(res);
    } catch (err) {
      return AppResponse(success: false, message: err.toString());
    } finally {
      AppService.setLoading(false);
    }
  }

  Future<AppResponse> logout() async {
    try {
      // AppService.setLoading(true);
      // var res = await getInstance().post('/auth/login', data: data);
      // if (res.statusCode == 200) {
      //   await storage.write(key: 'api-token', value: res.data['accessToken']);
      //   token = res.data['accessToken'];
      //   return AppResponse(success: true);
      // }
      // throwResponse(res);
      await storage.delete(key: 'api-token');
      return AppResponse(success: true);
    } catch (err) {
      return AppResponse(success: false, message: err.toString());
    } finally {
      // AppService.setLoading(false);
    }
  }
}

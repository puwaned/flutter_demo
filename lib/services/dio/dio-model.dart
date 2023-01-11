class AppResponse<T extends dynamic> {
  final bool success;
  final String message;
  final T? data;

  AppResponse({this.data, this.message = "", required this.success});
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message); // Pass your message in constructor.

  @override
  String toString() {
    return message;
  }
}

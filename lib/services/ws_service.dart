import 'dart:convert';

import 'package:http/http.dart' as http;

mixin WsService {
  Future<http.Response?> executeHttpRequest(
      {required String url,
        String method = HttpMethod.GET,
        Map<String, dynamic>? body}) async {
    switch (method) {
      case HttpMethod.GET:
        return http.get(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ).catchError((e) {
          throw 'executeHttpRequest() error :$e';
        });
      case HttpMethod.DELETE:
        return http.delete(
          Uri.parse(url),
          body:jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ).catchError((e) {
          throw 'executeHttpRequest() error :$e';
        });
      case HttpMethod.POST:
        return http.post(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ).catchError((e) {
          throw 'executeHttpRequest() error :$e';
        });
      case HttpMethod.PUT:
        return http.put(
          Uri.parse(url),
          body: jsonEncode(body),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ).catchError((e) {
          throw 'executeHttpRequest() error :$e';
        });
      default:
        return null;
    }
  }
}

class HttpMethod {
  static const String PUT = 'PUT';
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String FILE = 'DELETE';
}
import 'dart:convert';

import 'package:http/http.dart';

import 'dart:io';

class DataConst {
  static const String sourceUrl = "http://10.0.2.2:5000";
  static Uri getUrl(String tail) => Uri.parse(sourceUrl + tail);
  static String getRawUrl(String tail) => sourceUrl + tail;
  static const Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    "Keep-Alive": "timeout=5, max=1000"
  };
}

class BaseService {
  final Map<String, String> _headers = DataConst.httpHeaders;

  final String apiUrl = DataConst.sourceUrl;

  Future<Map<String, dynamic>> fetchInfo(String path) async {
    try {
      Response res = await _get(path);
      if (res.statusCode == 200) {
        Map<String, dynamic> bodyRes = jsonDecode(res.body);
        return bodyRes;
      } else {
        throw Exception(res.body);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<Map<String, dynamic>?> createNewInfo(String path,
      {required Map<String, dynamic> updateMap}) async {
    final String bodyRequest = jsonEncode(updateMap);

    Response res = await _post(path, bodyRequest);

    if (res.statusCode == 200) {
      Map<String, dynamic> bodyResponse = jsonDecode(res.body);
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> updateInfo(String path,
      {required Map<String, dynamic> updateMap}) async {
    final String bodyRequest = jsonEncode(updateMap);

    Response res = await _put(path, bodyRequest);

    if (res.statusCode == 200) {
      Map<String, dynamic> bodyResponse = jsonDecode(res.body);
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> deleteInfo(String path, {required String id}) async {
    Response res = await _delete(path, id);

    if (res.statusCode == 200) {
      Map<String, dynamic> bodyResponse = jsonDecode(res.body);
      return bodyResponse;
    } else {
      throw Exception("Delete request fails");
    }
  }

  Duration get _requestTimeout => const Duration(seconds: 4);
  Future<Response> _get(String path) {
    print(["service", DataConst.getUrl(path)]);
    return get(DataConst.getUrl(path));
  }

  Future<Response> _post(String path, String bodyRequest) async =>
      await post(DataConst.getUrl(path), body: bodyRequest).timeout(_requestTimeout);
  Future<Response> _put(String path, String bodyRequest) =>
      put(DataConst.getUrl(path), body: bodyRequest).timeout(_requestTimeout);
  Future<Response> _delete(String path, String id) =>
      delete(DataConst.getUrl(path), body: id).timeout(_requestTimeout);
}

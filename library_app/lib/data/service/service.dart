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
    Response res = await get(DataConst.getUrl(path), headers: _headers);

    if (res.statusCode == 200) {
      Map<String, dynamic> bodyRes = jsonDecode(res.body);
      return bodyRes;
    } else {
      throw Exception("Load information fails");
    }
  }

  Future<Map<String, dynamic>?> createNewInfo(String path,
      {required Map<String, dynamic> updateMap}) async {
    final String bodyRequest = jsonEncode(updateMap);

    Response res = await post(DataConst.getUrl(path), body: bodyRequest);

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

    Response res = await put(DataConst.getUrl(path), body: bodyRequest);

    if (res.statusCode == 200) {
      Map<String, dynamic> bodyResponse = jsonDecode(res.body);
      return bodyResponse;
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>> deleteInfo(String path, {required String id}) async {
    Response res = await delete(DataConst.getUrl(path), body: id);

    if (res.statusCode == 200) {
      Map<String, dynamic> bodyResponse = jsonDecode(res.body);
      return bodyResponse;
    } else {
      throw Exception("Delete request fails");
    }
  }
}

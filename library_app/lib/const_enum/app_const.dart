import 'dart:io';

class DataConst {
  static const String sourceUrl = "http://10.0.2.2:5000";
  static Uri getUrl(String tail) => Uri.parse(sourceUrl + tail);
  static String getRawUrl(String tail) => sourceUrl + tail;
  static const Map<String, String> httpHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
    "Connection": "Keep-Alive",
    // "Keep-Alive": "timeout=5, max=1000"
  };
}

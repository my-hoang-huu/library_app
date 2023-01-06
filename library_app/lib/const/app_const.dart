class DataConst {
  static const String sourceUrl = "http://10.0.2.2:5000";
  static Uri getUrl(String tail) => Uri.parse(sourceUrl + tail);
}

// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String BASE_URL = "http://coding-assignment.bombayrunning.com";
  static const String FETCH_STOCKS_URL =
      "$BASE_URL/${ApiRouteConstants.FETCH_STOCKS_PATH}";
}

class ApiRouteConstants {
  static const String FETCH_STOCKS_PATH = "data.json";
}

class Localization {
  static const String setParams = "Set Parameters";
  static const String internetConnected = "INTERNET CONNECTED";
  static const String internetDisconnected = "INTERNET DISCONNECTED";
  static const String somethingWentWrong = "Something Went Wrong";
}

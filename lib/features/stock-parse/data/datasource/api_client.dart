import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stock_scan/core/constants/app_constants.dart';
import 'package:stock_scan/core/errors/exceptions.dart';
import 'package:stock_scan/features/stock-parse/data/models/scan/scan_model.dart';

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  Future<List<ScanModel>> fetchStocksData() async {
    final response = await client.get(Uri.parse(AppConstants.FETCH_STOCKS_URL));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((element) => ScanModel.fromJson(element)).toList();
    } else {
      throw ServerException();
    }
  }
}

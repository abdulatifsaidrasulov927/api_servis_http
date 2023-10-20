import 'dart:convert';

import 'package:api_servis_http/model/currency_model.dart';
import 'package:api_servis_http/model/universal_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UneversalData> getAllCurrencies() async {
    Uri uri = Uri.parse("https://nbu.uz/en/exchange-rates/json/");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UneversalData(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => CurrencyModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UneversalData(error: "Error");
    } catch (error) {
      return UneversalData(error: error.toString());
    }
  }
}

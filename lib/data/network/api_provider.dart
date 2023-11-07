import 'dart:convert';

import 'package:api_servis_http/model/currency_model.dart';
import 'package:api_servis_http/model/universal_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<UneversalData> getAllCurrencies() async {
    //http://5a46-84-54-71-84.ngrok-free.app/jobs/
    //https://offordapi-o2js.onrender.com/jobs/
    Uri uri = Uri.parse("https://offordapi-o2js.onrender.com/jobs/");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UneversalData(
            data: CurrencyModel.fromJson(jsonDecode(response.body)));
      }
      print(response.statusCode);
      return UneversalData(error: "Error");
    } catch (error) {
      return UneversalData(error: error.toString());
    }
  }
}

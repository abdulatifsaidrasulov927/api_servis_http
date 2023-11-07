import 'package:api_servis_http/data/network/api_provider.dart';
import 'package:api_servis_http/model/currency_model.dart';
import 'package:api_servis_http/model/universal_model.dart';

class CurrencyRepository {
  final ApiProvider apiProvider;
  CurrencyRepository({required this.apiProvider});

  Future<WeatherMainModel> fetchCurrencies() async {
    UneversalData uneversalData = await apiProvider.getAllCurrencies();
    if (uneversalData.error.isEmpty) {
      return uneversalData.data as WeatherMainModel;
    }
    print(uneversalData.error);
    return WeatherMainModel(next: null, count: 0, prev: null, weatherModel: []);
  }
}

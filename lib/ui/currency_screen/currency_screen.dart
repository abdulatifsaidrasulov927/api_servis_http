import 'package:api_servis_http/data/network/api_provider.dart';
import 'package:api_servis_http/data/network/currency_repostory.dart';
import 'package:api_servis_http/model/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final CurrencyRepository currencyRepository =
      CurrencyRepository(apiProvider: ApiProvider());

  List<CurrencyModel> currensieas = [];

  bool isLoading = false;

  _fetchData() async {
    setState(() {
      isLoading = true;
    });

    currensieas = await currencyRepository.fetchCurrencies();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<CurrencyModel>>(
            future: currencyRepository.fetchCurrencies(),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<CurrencyModel>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                List<CurrencyModel> currency = snapshot.data!;

                return currensieas.isNotEmpty
                    ? ListView(
                        children: List.generate(currensieas.length, (index) {
                          return ListTile(
                            title: Text(currency[index].title),
                            subtitle: Text(currency[index].code),
                            trailing: Text(currency[index].nbuCellPrice),
                          );
                        }),
                      )
                    : const Center(
                        child: Text('xatolik sodir boldi'),
                      );
              }

              return const Center(child: CircularProgressIndicator());
            }));
  }
}

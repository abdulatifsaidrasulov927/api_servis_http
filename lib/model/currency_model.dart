class CurrencyModel {
  //   "title": "Swiss Franc",
  //   "code": "CHF",
  //   "cb_price": "13611.18",
  //   "nbu_buy_price": "12900.00",
  //   "nbu_cell_price": "14100.00",
  //   "date": "10/20/2023 11:00:01 am"
  // },
  final String title;
  final String code;
  final String cbPrice;
  final String nbuBuyPrice;
  final String nbuCellPrice;
  final String date;

  CurrencyModel(
      {required this.cbPrice,
      required this.code,
      required this.date,
      required this.nbuBuyPrice,
      required this.nbuCellPrice,
      required this.title});

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
        cbPrice: json['cb_price'] as String? ?? "",
        code: json['code'] as String? ?? "",
        date: json['date'] as String? ?? "",
        nbuBuyPrice: json['nbu_buy_price'] as String? ?? "",
        nbuCellPrice: json['nbu_cell_price'] as String? ?? "",
        title: json['title'] as String? ?? "");
  }
}

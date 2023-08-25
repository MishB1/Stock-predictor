import 'package:stock_predictor/models/symbols_models.dart';

Map<String, String> companySymbols = {};

createSymbolsMap(List<Company> companies) {
  companies.forEach((company) {
    companySymbols.addEntries({company.symbol: company.name}.entries);
  });
}

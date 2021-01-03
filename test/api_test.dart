import 'package:flutter_test/flutter_test.dart';
import 'package:novel_covid_19/controllers/covid_api.dart';
import 'package:novel_covid_19/models/global_info_model.dart';

void main() {
  test('Get global info', () async {
    CovidApi api = CovidApi();
    GlobalInfo info = await api.getGlobalInfo();
  });

  test('Get all countries info', () async {
    CovidApi api = CovidApi();
    var list = await api.getAllCountriesInfo();
  });

  test('Get country by name', () async {
    CovidApi api = CovidApi();
    var country = await api.getCountryByName('Pakistan');
  });
}

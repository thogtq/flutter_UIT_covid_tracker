import 'dart:convert';
import 'package:novel_covid_19/models/country_model.dart';
import 'package:novel_covid_19/models/global_info_model.dart';
import '../global.dart';
import '../models/country_model.dart';

class CovidApi {
  Future<GlobalInfo> getGlobalInfo() async {
    String response = await netWorkCalls.get(UrlConstants.globalInfo);
    return GlobalInfo.fromJson(jsonDecode(response));
  }

  Future<List<Country>> getAllCountriesInfo() async {
    var response = await netWorkCalls.get(UrlConstants.allCountries);
    var list = jsonDecode(response) as List;
    return list.map((item) => Country.fromJson(item)).toList();
  }

  Future<Country> getCountryByName(String country) async {
    var response =
        await netWorkCalls.get('${UrlConstants.allCountries}/$country');
    var data = Country.fromJson(jsonDecode(response));
    return data;
  }

  Future<String> getFlagUrl(String countryName) async {
    var response;
    String flag;
    List<dynamic> listJson;
    Map<String, dynamic> mapJson;
    try {
      response =
          await netWorkCalls.get('${UrlConstants.countryCode}/$countryName');
      listJson = jsonDecode(response);
      mapJson = listJson[0];
      flag = mapJson['flag'];
    } catch (Ex) {
      return null;
    } finally {}
    return flag;
  }
  /*
    Future<String> getFlagUrl(String countryName) async {
    var response =
        await netWorkCalls.get('${UrlConstants.countryCode}/$countryName');
    Map<String, dynamic> json = jsonDecode(response);
    //String countryCode = json['alpha2Code'];
    String countryCode = 'us';
    return UrlConstants.countryFlags + countryCode + '.png';
  }
  * */
}

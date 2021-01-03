import 'dart:convert';

import '../global.dart';
import '../global.dart';

class Country {
  String country;
  String flagUrl;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int totalTests;
  int testsPerOneMillion;
  void setFlagUrl(String flag) {
    this.flagUrl = flag;
  }

  Country(
      {this.country,
      this.flagUrl,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.totalTests,
      this.testsPerOneMillion});

  Country.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
    critical = json['critical'];
    casesPerOneMillion = json['casesPerOneMillion'];
    deathsPerOneMillion = json['deathsPerOneMillion'];
    totalTests = json['totalTests'];
    testsPerOneMillion = json['testsPerOneMillion'];
  }
  Country.fromJsonUrl(Map<String, dynamic> json) {
    flagUrl = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    data['casesPerOneMillion'] = this.casesPerOneMillion;
    data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['totalTests'] = this.totalTests;
    data['testsPerOneMillion'] = this.testsPerOneMillion;
    data['flagUrl'] = this.flagUrl;
    return data;
  }
}

class HomeCountry {
  final String name;
  final String cases;
  final String deaths;

  HomeCountry({
    this.name,
    this.cases,
    this.deaths,
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novel_covid_19/controllers/covid_api.dart';
import 'package:novel_covid_19/custom_widgets/virus_loader.dart';
import 'package:novel_covid_19/global.dart';
import 'package:novel_covid_19/models/country_model.dart';
import 'country_detail.dart';
//import 'package:image_downloader/image_downloader.dart';

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

class _CountryListPageState extends State<CountryListPage> {
  String flagDir = "assets/flag/";
  bool _isLoading = false;
  CovidApi api = CovidApi();
  var items = List<Country>();
  var _focusNode = FocusNode();
  List<Country> _countries = List<Country>();
  var _controller = TextEditingController();

  HomeCountry _homeCountry;

  @override
  void initState() {
    super.initState();
    _fetchCountries();
  }

  void filterSearchResults(String query) {
    List<Country> dummySearchList = List<Country>();
    dummySearchList.addAll(_countries);
    if (query.isNotEmpty) {
      List<Country> dummyListData = List<Country>();
      dummySearchList.forEach((item) {
        if (item.country.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(_countries);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? VirusLoader()
          : _countries == null
              ? buildErrorMessage()
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: TextFormField(
                          focusNode: _focusNode,
                          controller: _controller,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).accentColor,
                              ),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor)),
                              labelText: 'Tìm kiếm',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).accentColor),
                              hintText: 'Tên quốc gia'),
                          onChanged: filterSearchResults,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          var country = items[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              elevation: 4.0,
                              child: ListTile(
                                leading: SvgPicture.asset(
                                  flagDir + country.country + '.svg',
                                  height: 36,
                                ),
                                onTap: () {
                                  _controller.clear();
                                  filterSearchResults('');
                                  _focusNode.unfocus();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => CountryDetailPage(
                                          countryName: country.country),
                                    ),
                                  );
                                },
                                title: Row(
                                  children: <Widget>[
                                    Text(country.country),
                                    if (_homeCountry != null &&
                                        _homeCountry.name
                                                .compareTo(country.country) ==
                                            0)
                                      Icon(
                                        Icons.home,
                                        size: 16.0,
                                      )
                                  ],
                                ),
                                subtitle: Text(
                                    'Ca nhiễm: ' + country.cases.toString()),
                                trailing: Icon(Icons.arrow_right),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
    );
  }

  Center buildErrorMessage() {
    return Center(
      child: Text(
        'Unable to fetch data',
        style: Theme.of(context).textTheme.title.copyWith(color: Colors.grey),
      ),
    );
  }

  void _fetchCountries() async {
    try {
      setState(() => _isLoading = true);
      var list = await mySharedPreferences.fetchHomeCountry();
      var countries = await api.getAllCountriesInfo();

      //Loop countries to get flag and download, rename to country name
      //Use with ImageDownloader lib
      /*     for (var v in countries) {
        var flag = await api.getFlagUrl(v.country);
        if (flag != null) {
          await ImageDownloader.downloadImage(flag,
              destination: AndroidDestinationType.custom(directory: "flag")
                ..inExternalFilesDir()
                ..subDirectory("/${v.country}.svg"));
        }
      }*/

      setState(() {
        _countries = countries;
        items.addAll(_countries);
        if (list != null)
          setState(() {
            _homeCountry = HomeCountry(
              name: list[0],
              cases: list[1],
              deaths: list[2],
            );
          });
      });
    } catch (ex, s) {
      print(ex.toString() + s.toString());
      setState(() => _countries = null);
    } finally {
      setState(() => _isLoading = false);
    }
  }
}

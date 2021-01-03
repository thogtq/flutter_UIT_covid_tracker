import 'package:flutter/material.dart';
import 'package:novel_covid_19/custom_widgets/theme_switch.dart';
import 'package:novel_covid_19/views/personal_info.dart';
import 'country_list.dart';
import 'global_info.dart';

class HomePageMaster extends StatefulWidget {
  @override
  _HomePageMasterState createState() => _HomePageMasterState();
}

class _HomePageMasterState extends State<HomePageMaster> {
  String _currentAppBarTitle = 'Thế giới';
  int _currentIndex = 0;

  List<Widget> _widgets = <Widget>[
    GlobalInfoPage(),
    CountryListPage(),
    PersonalInfoScreen(),
  ];

  bool _showNavigationRail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentAppBarTitle,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Theme.of(context).accentColor,
          onPressed: () {
            setState(() {
              _showNavigationRail = !_showNavigationRail;
            });
          },
        ),
        actions: <Widget>[
          ThemeSwitch(),
        ],
      ),
      body: Row(
        children: [
          AnimatedCrossFade(
              crossFadeState: _showNavigationRail
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 300),
              alignment: Alignment.topCenter,
              firstChild: SizedBox(
                height: 0,
              ),
              secondChild: SizedBox(
                height: 800,
                child: NavigationRail(
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                    switch (index) {
                      case 0:
                        _currentAppBarTitle = 'Thế giới';
                        break;
                      case 1:
                        _currentAppBarTitle = 'Quốc gia';
                        break;
                      case 2:
                        _currentAppBarTitle = 'Thông tin';
                        break;
                    }
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.public),
                      selectedIcon: Icon(
                        Icons.public,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Home',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.list),
                      selectedIcon: Icon(
                        Icons.list,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Quốc gia',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.info),
                      selectedIcon: Icon(
                        Icons.info,
                        color: Theme.of(context).accentColor,
                      ),
                      label: Text(
                        'Thông tin',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(child: _widgets.elementAt(_currentIndex)),
        ],
      ),
    );
  }
}

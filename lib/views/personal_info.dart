import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 93.0,
                      backgroundColor: Theme.of(context).accentColor,
                      child: CircleAvatar(
                        radius: 90.0,
                        backgroundImage: AssetImage(
                          'assets/icon/amesmol2.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'UIT learning',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Theme.of(context).accentColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text('sinh viên \n'
                        '17521018 17521100 \n\n',
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center),
                    Text('Ứng dụng nền tảng android giúp theo dõi thông tin tổng quan covid-19 tại thời điểm hiện tại',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1
                            .copyWith(color: Theme.of(context).accentColor),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('made by Flutter')],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

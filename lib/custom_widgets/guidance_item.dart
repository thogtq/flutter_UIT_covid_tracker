import 'package:flutter/material.dart';

class GuidanceItem extends StatelessWidget {
  final String title;
  final String content;
  final String imageDir;
  GuidanceItem({
    @required this.title,
    @required this.content,
    @required this.imageDir,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: Text(title),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Image.asset(imageDir),
        ],
      ),
    );
  }
}

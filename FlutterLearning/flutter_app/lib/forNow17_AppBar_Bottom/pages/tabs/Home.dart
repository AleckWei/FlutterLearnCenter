import 'package:flutter/material.dart';
// import 'package:flutter_app/forNow16_ReturnRoot/pages/Search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/appBarDemo');
            },
            child: Text('转到appBarPage'),
          ),
          SizedBox(width:10),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/appBarDemo2');
            },
            child: Text('转到appBarPage2'),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Hero(
              tag: 'login',
              child: Material(
                color: Colors.transparent,
                child: Image.asset(
                  'assets/images/ic_mylove.png',
                  width: 33,
                  height: 33,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

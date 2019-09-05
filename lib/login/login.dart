import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nestapp/widget/CommonHeader.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(
        titleText: '登录',
        autoLeading: false,
      ),
      body: Container(
        child: Row(
          children: <Widget>[],
        ),
      ),
    );
  }
}

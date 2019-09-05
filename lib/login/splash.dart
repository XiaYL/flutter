import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nestapp/login/login.dart';
import 'package:nestapp/utils/CommonUtils.dart';

class SplashScreen extends StatefulWidget {
  final String title;

  @override
  const SplashScreen({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  String title;
  TimerUtils timerUtils;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    timerUtils = TimerUtils();
    timerUtils.createTimer(5000, () {
      openWindow();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // Center the content
      child: Center(
        // Add Text
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('data/img/bg1.jpg'),
        fit: BoxFit.cover,
      )),
    ));
  }

  @override
  void dispose() {
    super.dispose();
    timerUtils.releaseTimer();
  }

  openWindow() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }
}

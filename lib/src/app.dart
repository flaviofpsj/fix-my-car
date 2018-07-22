import 'package:flutter/material.dart';
import 'components/login/login_screen.dart';
import 'components/home/home_screen.dart';
import 'components/service/service_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => new LoginScreen(),
        '/Home': (BuildContext context) => new HomeScreen(),
        '/Service': (BuildContext context) => new ServiceScreen(),
      },
      title: 'Fix My Car',
      home: new Scaffold(
        body: new LoginScreen(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../mixins/validation_with_reusable.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with ValidationWithReusable {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Fix My Car'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {},
          ),
          new PopupMenuButton(
            tooltip: 'Settings',
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              new PopupMenuItem(
                child: new Text('Settings'),
                value: () {},
              ),
              new PopupMenuItem(
                child: new Text('Help'),
                value: () {},
              ),
            ]
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Flavio Farias'),
              accountEmail: new Text('ffpsj@ic.ufal.br'),
              onDetailsPressed: () {},
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text('F'),
              ),
            ),
            new ListTile(
              title: new Text('Home'),
              leading: new Icon(Icons.home),
              onTap: () => Navigator.of(context).pushNamed('/Home'),
            ),
            new ListTile(
              title: new Text('Bookings'),
              leading: new Icon(Icons.event_note),
              onTap: () {},
              trailing: new Chip(
                backgroundColor: Colors.teal,
                label: new Text(
                  '3',
                  style: new TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            new ListTile(
              title: new Text('Account Settings'),
              leading: new Icon(Icons.account_circle),
              onTap: () {},
            ),
            new Divider(),
            new ListTile(
              title: new Text('Logout'),
              leading: new Icon(Icons.power_settings_new),
              onTap: () => Navigator.of(context).pushNamed('/Login'),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.symmetric(vertical: 15.0),),
              new Text(
                'Select the Service',
                style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 15.0),),
              rowBuilder(
                cardBuilder('Motor', 'images/motor.png', () => Navigator.of(context).pushNamed('/Service'),),
                cardBuilder('Tire Shop', 'images/borracharia.png', () => Navigator.of(context).pushNamed('/Service'),),
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
              rowBuilder(
                cardBuilder('Electric', 'images/eletrico.png', () => Navigator.of(context).pushNamed('/Service'),),
                cardBuilder('Wash', 'images/lavagem.png', () => Navigator.of(context).pushNamed('/Service'),),
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
              rowBuilder(
                cardBuilder('Upholstered', 'images/estofado.png', () => Navigator.of(context).pushNamed('/Service'),),
                cardBuilder('Bodywork', 'images/lataria.png', () => Navigator.of(context).pushNamed('/Service'),),
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
            ],
          ),
        ],
      ),
    );
  }
}
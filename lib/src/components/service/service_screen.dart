import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import '../../mixins/validation_with_reusable.dart';

class ServiceScreen extends StatefulWidget {
  @override
  ServiceScreenState createState() => ServiceScreenState();
}

class ServiceScreenState extends State<ServiceScreen> with ValidationWithReusable {

  dynamic latitude = -9.630749;
  dynamic longitude = -35.740619;
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  //var staticMapProvider = new StaticMapProvider('<your_api_key>');
  //Uri staticMapUri;

  List<Marker> markers = <Marker>[
    new Marker(
      '1',
      'Shopping Farol',
      -9.628028,
      -35.738371,
      color: Colors.red,
    ),
    new Marker(
      '2',
      'Aurelio Buarque',
      -9.624199,
      -35.744201,
      color: Colors.blue,
    ),
  ];

  showMap() {
    mapView.show(
      new MapOptions(
        mapViewType: MapViewType.normal,
        initialCameraPosition: new CameraPosition(
          new Location(
            latitude,
            longitude,
          ),
          15.0,
        ),
        showUserLocation: true,
        showMyLocationButton: true,
        showCompassButton: true,
        title: 'Where are you?',
      ),
      toolbarActions: [
        new ToolbarAction('SEND', 1),
        new ToolbarAction('CLOSE', 2),
      ],
    );
    mapView.onToolbarAction.listen((id) {
      if(id == 1 || id == 2) {
        mapView.dismiss();
      }
    });
    mapView.onMapTapped.listen((_) {
      setState(() {
        mapView.setMarkers(markers);
        mapView.zoomToFit(padding: 100);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    cameraPosition = new CameraPosition(
      new Location(
        latitude,
        longitude,
      ),
      15.0,
    );
    /*staticMapUri = staticMapProvider.getStaticUri(
      new Location(
        latitude,
        longitude,
      ),
      15,
      height: 500,
      mapType: StaticMapViewType.roadmap,
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Service'),
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
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Padding(padding: new EdgeInsets.symmetric(vertical: 15.0),),
              new Text(
                'Select the Type of Help',
                style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 15.0),),
              rowBuilder(
                cardBuilder('Solve Alone', 'images/resolver.png', () {}),
                cardBuilder('Request Mechanic', 'images/mecanico.png', () => showMap()),
              ),
              new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
            ],
          ),
        ],
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Send your Location'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Stack(
                children: <Widget>[
                  new Container(
                    child: new Text('Map should show here!'),
                    padding: new EdgeInsets.symmetric(vertical: 60.0),
                  ),
                  new InkWell(
                    child: new Image.network(staticMapUri.toString()),
                    onTap: showMap,
                  ),
                ],
              ),
            ),
            new Container(
              padding: new EdgeInsets.symmetric(vertical: 25.0),
              child: new Text(
                'Tap the map to interact',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.redAccent,
                ),
              ),
            ),
            new Card(
              elevation: 5.0,
              child: new Container(
                margin: new EdgeInsets.all(50.0),
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'Camera Position',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 5.0),),
                    new Text('Latitude: ${cameraPosition.center.latitude}'),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 5.0),),
                    new Text('Longitude: ${cameraPosition.center.longitude}'),
                    new Padding(padding: new EdgeInsets.symmetric(vertical: 5.0),),
                    new Text('Zoom: ${cameraPosition.zoom}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }*/
}
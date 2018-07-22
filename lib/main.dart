import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';
import 'src/app.dart';

void main() {
  MapView.setApiKey('<your_api_key>');
  runApp(new App());
}
import 'package:flutter/material.dart';

class ValidationWithReusable {
  String validateEmail (String value) {
    if(!value.contains('@')) {
      return 'Invalid Email';
    }
    return null;
  }

  String validatePassword (String value) {
    if(value.length < 6) {
      return 'Password too short';
    }
    return null;
  }

  Container buildButton(Color color, String label, Function callback) {
    return new Container(
      height: 45.0,
      width: double.infinity,
      child: new RaisedButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)
        ),
        color: color,
        child: new Text(
          label,
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: callback,
      ),
    );
  }

  Container buildText(String label, Color color, double size) {
    return new Container(
      child: new Text(
        label,
        style: new TextStyle(
          color: color,
          fontSize: size,
        ),
      ),
    );
  }

  GestureDetector cardBuilder(String label, String url, Function callback) {
    return new GestureDetector(
      onTap: callback,
      child: new Container(
        margin: new EdgeInsets.symmetric(horizontal: 10.0),
        child: new Card(
          elevation: 5.0,
          child: new Column(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 15.0),
                width: 80.0,
                child: new Image.asset(url),
              ),
              new Text(
                label,
                style: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 35.0),)
            ],
          ),
        ),
      ),
    );
  }

  Row rowBuilder(GestureDetector one, GestureDetector two) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: one,
        ),
        new Expanded(
          child: two,
        ),
      ],
    );
  }
}
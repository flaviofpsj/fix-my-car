import 'package:flutter/material.dart';
import '../../mixins/validation_with_reusable.dart';
//import '../../models/user_model.dart';
//import 'package:http/http.dart';
//import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ValidationWithReusable {

  //final String urlSignIn = '<rest_api_url_here>';
  //final String urlSignUp = '<rest_api_url_here>';
  final formKey = GlobalKey<FormState>();
  FocusNode textSecondFocusNode = new FocusNode();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Colors.white,
              Colors.grey[50],
              Colors.grey[100],
              Colors.grey[200],
              Colors.grey[300],
              Colors.grey[350],
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
          )
        ),
        child: new Container(
          margin: new EdgeInsets.symmetric(horizontal: 65.0),
          child: new Form(
            key: formKey,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildText('Welcome to', Colors.black38, 18.0),
                buildText('Fix My Car', Colors.black54, 36.0),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
                emailForm(),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
                passwordForm(),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 20.0),),
                buildButton(Colors.blueAccent, 'SIGN IN', () {
                  if(formKey.currentState.validate()) {
                    formKey.currentState.save();
                    Navigator.of(context).pushNamed('/Home');
                  }
                },
                /*() async {
                  if(formKey.currentState.validate()) {
                    formKey.currentState.save();
                    Map myMap = {'email': this.email, 'password': this.password};
                    var response = await post(urlSignIn, body: myMap);
                    this.email = '';
                    this.password = '';
                    if(response.statusCode == 200) {
                      Navigator.of(context).pushNamed('/Home');
                    }
                    else {
                      final submittedAction = SnackBar(
                        content: Text('Login Failed'),
                      );
                      Scaffold.of(context).showSnackBar(submittedAction);
                    }
                    var user = User.fromJson(json.decode(response.body));
                    print(user.toString());
                  }
                }*/),
                new Padding(padding: new EdgeInsets.symmetric(vertical: 10.0),),
                buildButton(Colors.redAccent, 'SIGN UP', () {
                  if(formKey.currentState.validate()) {
                    formKey.currentState.save();
                    Navigator.of(context).pushNamed('/Home');
                  }
                },
                /*() async {
                  if(formKey.currentState.validate()) {
                    formKey.currentState.save();
                    Map myMap = {'email': this.email, 'password': this.password};
                    var response = await post(urlSignUp, body: myMap);
                    this.email = '';
                    this.password = '';
                    if(response.statusCode == 201) {
                      Navigator.of(context).pushNamed('/Home');
                    }
                    else {
                      final submittedAction = SnackBar(
                        content: Text('Account Create Failed'),
                      );
                      Scaffold.of(context).showSnackBar(submittedAction);
                    }
                    var user = User.fromJson(json.decode(response.body));
                    print(user.toString());
                  }
                }*/),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailForm() {
    return new Container(
      child: new TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
          labelText: 'Email',
          hintText: 'Type your Email'
        ),
        validator: validateEmail,
        onSaved: (String value) {
          email = value;
        },
        onFieldSubmitted: (String value) {
          FocusScope.of(context).requestFocus(textSecondFocusNode);
        },
      ),
    );
  }

  Widget passwordForm() {
    return new Container(
      child: new TextFormField(
        obscureText: true,
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(
          labelText: 'Password',
          hintText: 'Type your Password'
        ),
        validator: validatePassword,
        onSaved: (String value) {
          password = value;
        },
        focusNode: textSecondFocusNode,
      ),
    );
  }
}
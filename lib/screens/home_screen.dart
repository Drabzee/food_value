import 'package:flutter/material.dart';
import './ngo_login_screen.dart';
import './user_login_screen.dart';

class HomeScreen extends StatelessWidget {

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: double.infinity, height: 120.0),
          Image.asset('assets/logo.jpg', scale: 5.0),
          SizedBox(height: 20.0),
          Image.asset('assets/ngo_connect.png', scale: 3.0),
          SizedBox(height: 50.0),
          RaisedButton(
            child: Text('NGO Login', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width-280.0, vertical: 13.0),
            color: Color(0xFF468747),
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NGOLoginScreen()));
            },
          ),
          SizedBox(height: 10.0),
          FlatButton(
            child: Text('User Login', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width-280.0, vertical: 15.0),
            color: Colors.white,
            textColor: Color(0xFF468747),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserLoginScreen()));
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(context),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/user_model.dart';

class UserLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserLoginScreenState();
  }
}

class UserLoginScreenState extends State<UserLoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();

  Widget buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF666666), width: 1.0)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        labelStyle: TextStyle(color: Color(0XFF468747)),
      ),
      validator: (String value) {
        if(value.length == 0)
          return 'Field is required';
      },
      onSaved: (String value) {
        _user.name = value;
      },
    );
  }

  Widget buildNumberOfFoodItemsField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Number Of Food Items',
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF666666), width: 1.0)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        labelStyle: TextStyle(color: Color(0XFF468747)),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if(value.length == 0)
          return 'Field is required';
      },
      onSaved: (String value) {
        _user.numberOfItems = int.parse(value);
      },
    );
  }

  Widget buildAddressField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Pickup Address',
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF666666), width: 1.0)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        labelStyle: TextStyle(color: Color(0XFF468747)),
      ),
      maxLines: 3,
      validator: (String value) {
        if(value.length == 0)
          return 'Field is required';
      },
      onSaved: (String value) {
        _user.address = value;
      },
    );
  }

  Widget buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Food Description',
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF666666), width: 1.0)),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red, width: 1.0)),
        focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFF468747), width: 2.0)),
        labelStyle: TextStyle(color: Color(0XFF468747)),
      ),
      maxLines: 6,
      validator: (String value) {
        if(value.length == 0)
          return 'Field is required';
      },
      onSaved: (String value) {
        _user.description = value;
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text('Submit', style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width-280.0, vertical: 13.0),
      color: Color(0xFF468747),
      textColor: Colors.white,
      onPressed: () {
        if(!_formKey.currentState.validate())
          return;
        _formKey.currentState.save();
        print(_user.numberOfItems);
        Navigator.pop(context);
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          buildNameField(),
          SizedBox(height: 10.0),
          buildNumberOfFoodItemsField(),
          SizedBox(height: 10.0),
          buildAddressField(),
          SizedBox(height: 10.0),
          buildDescriptionField(),
          SizedBox(height: 20.0),
          buildSubmitButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NGO Login From'),
        centerTitle: true,
        backgroundColor: Color(0xFF468747),
      ),
      body: buildBody(context),
    );
  }
}
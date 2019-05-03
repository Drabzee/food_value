import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/ngo_model.dart';

class NGOLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NGOLoginScreenState();
  }
}

class NGOLoginScreenState extends State<NGOLoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final NGOModel _ngo = NGOModel();

  Widget buildOrgNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Organization Name',
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
        _ngo.organizationName = value;
      },
    );
  }

  Widget buildIDField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'NGO Unique ID',
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
        _ngo.id = value;
      },
    );
  }

  Widget buildDateField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1.0, color: Color(0xFF444444)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Active Since : ${_ngo.activeDate}', style: TextStyle(fontSize: 17.0, color: Color(0XFF468747))),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                lastDate: DateTime.now(),
                firstDate: DateTime(1940),
                builder: (BuildContext context, Widget child) {
                  return Theme(
                    data: ThemeData.dark(),
                    child: child
                  );
                }
              );
              setState(() {
                _ngo.activeDate = DateFormat.yMMMMd().format(date); 
              });
            },
          )
        ],
      )
    );
  }

  Widget buildAddressField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Address',
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
        _ngo.address = value;
      },
    );
  }

  Widget buildMobileField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Mobile',
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
        _ngo.phone = value;
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
          buildOrgNameField(),
          SizedBox(height: 10.0),
          buildIDField(),
          SizedBox(height: 10.0),
          buildDateField(),
          SizedBox(height: 10.0),
          buildAddressField(),
          SizedBox(height: 10.0),
          buildMobileField(),
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
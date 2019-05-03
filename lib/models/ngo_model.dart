import 'package:intl/intl.dart';

class NGOModel{
  String organizationName;
  String id;
  String activeDate = DateFormat.yMMMMd().format(DateTime.now());
  String address;
  String phone;
}
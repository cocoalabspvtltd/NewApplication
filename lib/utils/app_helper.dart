import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


MaterialColor primaryColor = MaterialColor(int.parse("0xff00095B"), const {

});

MaterialColor secondaryColor = MaterialColor(int.parse("0xffF6C220"), const {});

var screenWidth = 0.0;
var screenHeight = 0.0;
String rupeeSymbol = '₹';

void setScreenDimensions(BuildContext context) {

  screenHeight=MediaQuery.of(context).size.height;
  screenWidth = MediaQuery.of(context).size.width;
}

void toastMessage(dynamic message,
    {ToastGravity gravity = ToastGravity.BOTTOM}) {
  log('toast: $message');
  Fluttertoast.showToast(msg: '$message', gravity: gravity);
}

String parseformatDate(var _dt, [String? _format]) {
  var dateformat = new DateFormat(_format);
  DateFormat apidatedateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  try {
    return dateformat.format(apidatedateFormat.parse(_dt));
  } catch (e) {
    try {
      return DateFormat(_format).format(DateTime.parse(_dt));
    } catch (e2) {
      return '<ErrDate>';
    }
  }
}

String getDateGap(String dateReceived) {
  try {
    DateTime dateTimeCreatedAt = DateTime.parse(dateReceived);
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeCreatedAt.difference(dateTimeNow).inDays;
    print('$differenceInDays');
    return '$differenceInDays';
  } catch (e) {
    return "";
  }
}


double getFileSizeInMb(File file)  {
  int sizeInBytes = file.lengthSync();
  double sizeInMb = sizeInBytes / (1024 * 1024);

  print('${file.path}: $sizeInMb');
  return sizeInMb;
}


extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

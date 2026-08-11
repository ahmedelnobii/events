import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showSuccsesMessage(String message) => Fluttertoast.showToast(
    msg: message,
    gravity: .BOTTOM,
    toastLength: .LENGTH_LONG,
    backgroundColor: Colors.green,
    timeInSecForIosWeb: 5,
  );
  static void showFailedMessage(String? message) => Fluttertoast.showToast(
    msg: message ?? 'Something went wrong',
    gravity: .BOTTOM,
    toastLength: .LENGTH_LONG,
    backgroundColor: Colors.red,
    timeInSecForIosWeb: 5,
  );
}

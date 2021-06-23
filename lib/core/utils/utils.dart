import 'dart:convert';

import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

import 'app_color.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
class Utils {
  static const String FONT_FAMILY = "Nunito";

  static const String ERROR_NO_RESPONSE = "No response from server";
  static const String ERROR_NO_INTERNET = "Internet not connected";
  static const String ERROR_UNKNOWN = "Unknown error occurred";

  /// Helper channel to call native Android/iOS code
  static const platform = const MethodChannel('flutter.native/helper');

  /// Function to show the error toast message
  static void showErrorToast(
    String message,
    BuildContext context, {
    int duration = 1,
  }) {
    Toast.show(message, context, duration: duration);
  }

  /// Function to show the error toast message
  static void showToast(
    String message,
    BuildContext context, {
    int duration = 1,
  }) {
    Toast.show(message, context, duration: duration);
  }

  static void showProgressDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context1) {
        return WillPopScope(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
            onWillPop: () {
              return Future.value(false);
            });
      },
    );
  }

  /// Dismiss the keyboard
  static void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static getErrorFromDio(Response<dynamic> response) {
    if (response != null && response.data != null) {
      return response.data["message"];
    }
    return ERROR_UNKNOWN;
  }

  static printObject(Object object) {
    // Encode your object and then decode your object to Map variable
    Map jsonMapped = json.decode(json.encode(object));

    // Using JsonEncoder for spacing
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');

    // encode it to string
    String prettyPrint = encoder.convert(jsonMapped);

    // print or debugPrint your object
    debugPrint("=====================================================");
    debugPrint(prettyPrint);
    debugPrint("=====================================================");
  }
}

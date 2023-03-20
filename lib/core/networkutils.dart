// ignore_for_file: unnecessary_new, depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';

Future handleResponse(Response response) async {
  if (response.statusCode == 403) {
    toast('Unauthorized');
  } else if (response.statusCode == 400 && response.request!.method != 'GET') {
    var toasts = jsonDecode(response.body);
    toast(toasts["message"]);
  } else if (response.statusCode == 401) {
    toast('Unauthorized');
  } else if (response.statusCode == 422) {
    var toasts = jsonDecode(response.body);
    toast(toasts["message"]);
  } else if (response.statusCode == 500) {
    toast('Internal Server Error');
  } else if (response.statusCode == 503) {
    toast('Internal Server Error');
  }
  if (response.statusCode.isSuccessful()) {
    return jsonDecode(response.body);
  } else {
    if (response.body.isJson()) {
      throw jsonDecode(response.body);
    } else {
      if (!await isNetworkAvailable()) {
        throw "There is no internet connection";
      } else {
        throw 'Please try again';
      }
    }
  }
}


import 'package:e_commerce_project/core/networkutils.dart';
import 'package:http/http.dart' as http;

import 'dart:async';

Future getsubNews() async {
  var url =
     "https://www.indiacart.ca/webbeta/public/api/categories?pagination=0";
  return handleResponse(await http.get(
    Uri.parse(url),
  ));
}

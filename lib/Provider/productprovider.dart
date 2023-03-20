

import 'package:e_commerce_project/Model/productmodel.dart';
import 'package:flutter/material.dart';


class ProductProvider extends ChangeNotifier{
   List<ProductDetail> subchapdata = [];

  List<ProductDetail> get getsubchapter => subchapdata;

  set subchap(List<ProductDetail> subchaplist) {
    subchapdata = subchaplist;
    notifyListeners();
  }
}
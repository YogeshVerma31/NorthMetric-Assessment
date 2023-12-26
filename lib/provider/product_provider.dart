import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:testing_assessment/data/model/products_model.dart';
import 'package:testing_assessment/data/repository/auth/product_repository_impl.dart';

import '../utils/utils.dart';

class ProductsProvider extends ChangeNotifier {
  final _productRepositoryImpl = ProductRepositoryImpl();

  var _isLoading = false;

  final _productList = <ProductsModelData>[];

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setSelectedCard(bool value, int index) {
    _productList[index].isSelected = value;
    notifyListeners();
  }

  List<ProductsModelData> get productList => _productList;

  set productList(List<ProductsModelData> list) {
    _productList.clear();
    _productList.addAll(list);
    notifyListeners();
  }

  Future<void> handleVisits(BuildContext context) async {
    isLoading = true;
    final dashboardResponse = await _productRepositoryImpl.getProducts();
    dashboardResponse?.fold((l) {
      isLoading = false;
      showSnackBar(context, l.message.toString());
    }, (r) => _handleVisitsSuccess(r, context));
  }

  void _handleVisitsSuccess(
      List<ProductsModelData> list, BuildContext context) async {
    try {
      isLoading = false;
      productList = list;
    } catch (e) {
      isLoading = false;
      showSnackBar(context, e.toString());
    }
  }
}

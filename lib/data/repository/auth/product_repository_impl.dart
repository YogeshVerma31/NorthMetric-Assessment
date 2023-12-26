import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:testing_assessment/data/model/products_model.dart';
import 'package:testing_assessment/data/repository/auth/product_repository.dart';

import '../../../constants/api_constants.dart';
import '../../../utils/failure.dart';
import '../../../utils/typedef.dart';

class ProductRepositoryImpl extends ProductsRepository {
  @override
  EitherRequest<List<ProductsModelData>>? getProducts() async {
    try {
      if (kDebugMode) {
        print("Http=>${ApiConstants.designStylesApi}");
      }

      Response response = await get(
        Uri.parse(ApiConstants.designStylesApi),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (kDebugMode) {
        print("Http=>${ApiConstants.designStylesApi}");
      }
      if (kDebugMode) {
        print("Response ${response.statusCode}=>${response.body}");
      }

      if (response.statusCode == 200) {
        final item = json
            .decode(response.body)
            .map((e) => ProductsModelData.fromJson(e))
            .toList();

        return right(item.cast<ProductsModelData>());
      } else {
        return left(Failure(message: jsonDecode(response.body)['message']));
      }
    } catch (e) {
      print(e.toString());
      return left(Failure(message: e.toString()));
    }
  }
}

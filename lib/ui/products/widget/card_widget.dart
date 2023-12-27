import 'package:flutter/material.dart';
import 'package:testing_assessment/data/model/products_model.dart';
import 'package:testing_assessment/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:testing_assessment/utils/extensions.dart';

import '../../../utils/color.dart';

class CardWidget extends StatelessWidget {
  ProductsModelData data;
  int index;

  CardWidget({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<ProductsProvider>()
          .setSelectedCard(!data.isSelected, index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Card(
              color: cardBackgroundColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color:
                          data.isSelected ? borderColor : cardBackgroundColor,
                      width: 1.5),
                  borderRadius: BorderRadius.circular(7)),
              // color of grid items
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: Image.network(
                        data.image!,
                        errorBuilder: (context, _, error) => const Text(
                          "Something went wrong",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  data.isSelected
                      ? Positioned(
                          right: 0,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Checkbox(
                                value: data.isSelected,
                                onChanged: (value) => context
                                    .read<ProductsProvider>()
                                    .setSelectedCard(!data.isSelected, index)),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
          Text(
            data.name!,
            textAlign: TextAlign.center,
            style: const TextStyle().fontWeight500(10),
          )
        ],
      ),
    );
  }
}

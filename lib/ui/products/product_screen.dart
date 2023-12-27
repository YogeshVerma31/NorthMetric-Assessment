import 'package:flutter/material.dart';
import 'package:testing_assessment/provider/product_provider.dart';
import 'package:testing_assessment/ui/products/widget/card_widget.dart';
import 'package:testing_assessment/utils/extensions.dart';
import '../../mixin/base_page_mixin.dart';
import '../../utils/color.dart';
import '../../utils/size_config.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../base/base_screen.dart';
import 'package:provider/provider.dart';

import '../common/custom_button.dart';

class ProductScreen extends BasePageScreen {
  @override
  State<StatefulWidget> createState() => _ProductScreenState();
}

class _ProductScreenState extends BasePageScreenState<ProductScreen>
    with BaseScreen {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    setIsLoading(false);
    isAppBar(false);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      context.read<ProductsProvider>().handleVisits(context);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  String appBarTitle() {
    return '';
  }

  @override
  Widget body() {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  Strings.skip,
                  textAlign: TextAlign.right,
                  style: const TextStyle().fontWeight600(15),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _getTitle(),
          const SizedBox(
            height: 5,
          ),
          _getSubTitle(),
          const SizedBox(
            height: 25,
          ),
          Expanded(
            child: Consumer<ProductsProvider>(builder: (context, provider, _) {
              return provider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : provider.productList.isEmpty
                      ? Center(
                          child: Text(
                            "No Products Found",
                            style: const TextStyle().fontWeight500(14),
                          ),
                        )
                      : _listOfProducts(provider);
            }),
          ),
          _showRowButtons()
        ],
      ),
    );
  }

  _showRowButtons() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            text: 'Previous',
            onPressed: () {},
            leadingWidget: const Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
              size: 15,
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
              text: 'Next',
              onPressed: () {
                context.read<ProductsProvider>().getSelectedCard() == ''
                    ? showSnackBar(
                        context,
                        Strings.pleaseSelectAtleastOneProductToSave +
                            context.read<ProductsProvider>().getSelectedCard()!)
                    : showSnackBar(
                        context,
                        Strings.successfullySaved +
                            context
                                .read<ProductsProvider>()
                                .getSelectedCard()!);
              },
            ),
          ))
        ],
      ),
    );
  }

  _listOfProducts(ProductsProvider provider) {
    return Center(
      child: Scrollbar(
        thickness: 4,
        radius: const Radius.circular(10),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              childAspectRatio: .88,
              crossAxisSpacing: 6.0,
            ),
            itemCount: provider.productList.length,
            itemBuilder: (context, index) {
              return CardWidget(
                data: provider.productList[index],
                index: index,
              );
            }),
      ),
    );
  }

  _getTitle() {
    return Text(
      Strings.title,
      textAlign: TextAlign.start,
      style: const TextStyle().fontWeight600(16),
    );
  }

  _getSubTitle() {
    return Text(
      Strings.subtitle,
      style: const TextStyle().fontWeight500(13, fontColor: Colors.black87),
    );
  }

  @override
  void onClickBackButton() {}

  @override
  Widget drawer() {
    return const SizedBox.shrink();
  }

  @override
  GlobalKey<ScaffoldState> scaffoldStateKey() {
    return _key;
  }
}

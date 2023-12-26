import 'package:flutter/material.dart';

import '../../utils/color.dart';

abstract class BasePageScreen extends StatefulWidget {
  const BasePageScreen({Key? key}) : super(key: key);
}

abstract class BasePageScreenState<Page extends BasePageScreen>
    extends State<Page> {
  bool _isBack = true;
  bool _isAppBar = true;
  bool _isLoading = true;

  String appBarTitle();

  void onClickBackButton();

  void isBackButton(bool isBack) {
    _isBack = isBack;
    setState(() {});
  }

  Widget body();

  GlobalKey<ScaffoldState> scaffoldStateKey();

  Widget drawer();

  void isAppBar(bool isAppBar) {
    _isAppBar = isAppBar;
    setState(() {});
  }

  void showProgressBar({required String title, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              surfaceTintColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: primaryColor,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(message)
                ],
              ));
        });
  }

  void showSuccessBar({required String title, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
              surfaceTintColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: Image.asset("assets/images/success_logo.png")),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(message)
                ],
              ));
        });
  }

  void setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    setState(() {});
  }

  bool get isAppBarReq => _isAppBar;

  bool get isBackReq => _isBack;

  bool get isLoading => _isLoading;
}

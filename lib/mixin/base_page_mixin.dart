import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/base/base_screen.dart';

mixin BaseScreen<Page extends BasePageScreen> on BasePageScreenState<Page> {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldStateKey(),
      backgroundColor: Colors.white,
      appBar: isAppBarReq == true
          ? AppBar(
              titleSpacing: 0,
              automaticallyImplyLeading: false,
              centerTitle: isBackReq == false ? true : false,
              title: Text(
                appBarTitle(),
                style: const TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w600),
              ),
              leading: isBackReq == true
                  ? IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 15,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        onClickBackButton();
                      },
                    )
                  : const SizedBox.shrink(),
            )
          : PreferredSize(
              preferredSize: const Size(0.0, 0.0),
              child: Container(),
            ),
      body: SafeArea(
        child: _connectionStatus == ConnectivityResult.none
            ? _connectivityError()
            : Stack(
                children: [
                  body(),
                  isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox.shrink()
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Widget _connectivityError() {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .22),
        Image.asset(
          "assets/images/login_forget.png",
          height: MediaQuery.of(context).size.height * .27,
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text(
            'There is no Internet connection',
            textAlign: TextAlign.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text('Please check your Internet connection',
              textAlign: TextAlign.center),
        ),
      ],
    );
  }
}

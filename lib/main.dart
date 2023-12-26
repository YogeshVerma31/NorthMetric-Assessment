import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing_assessment/routes/route_settings.dart';
import 'package:testing_assessment/routes/routes_name.dart';
import 'package:testing_assessment/utils/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing routes',
      debugShowCheckedModeBanner: false,
      theme: Styles.themeData(context),
      onGenerateRoute: RouterSetting.generateRoute,
      initialRoute: RoutesName.productScreen,
    );
  }
}

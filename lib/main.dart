import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magic_villa/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Doodle Dash',
      themeMode: ThemeMode.dark,
      initialRoute: RouteNames.getVillaByIdScreen,
      getPages: AppRoute.route,
      theme: ThemeData(
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.audiowideTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      //home: const MyHomePage(title: 'Doodle Dash'),
    );
  }
}
//<binding protocol="http" bindingInformation=":1211:127.0.0.1" />
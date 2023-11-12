import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useme_app/routes/page_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/login',
      getPages: AppPage.pages,
    );
  }
}

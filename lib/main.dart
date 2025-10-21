import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/bindings/app_bindings.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/crypto_dashboard_screen.dart';
import 'package:roqqu_assessment/routes/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CryptoDashboardScreen(),
      debugShowCheckedModeBanner: false,
      getPages: RRouteHelper.routes,
      initialBinding: AppBindings(), 
    );
  }
}
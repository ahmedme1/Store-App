import 'package:flutter/material.dart';
import 'package:storapppp/screen/home_page.dart';
import 'package:storapppp/screen/update_product.dart';
import 'package:storapppp/services/update_product.dart';

void main() {
  runApp(const StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id : (context) =>  HomePage(),
        UpdateProductPage.id : (context) =>  UpdateProductPage(),
      },
      initialRoute: HomePage.id,
    );
  }
}


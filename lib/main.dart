import 'package:flutter/material.dart';
import 'package:food_api/home/home_page.dart';
import 'package:food_api/provider/food_provider.dart';
import 'package:food_api/user_authentication/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider<FoodProvider>(
        create: (context) => FoodProvider(),
     ),
  ],
  child: FoodApi(),
      ),
  );
}

class FoodApi extends StatelessWidget {
  const FoodApi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: LoginPage(),
    );
  }
}



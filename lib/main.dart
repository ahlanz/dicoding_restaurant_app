import 'package:dicoding_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_restaurant_app/screen/restaurant_detail_page.dart';
import 'package:dicoding_restaurant_app/screen/restaurant_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      initialRoute: RestaurantListPage.routName,
      routes: {
        RestaurantListPage.routName: (context) => RestaurantListPage(),
        RestaruantDetailPage.routName: (context) => RestaruantDetailPage(
              restaurant:
                  ModalRoute.of(context)?.settings.arguments as RestaurantModel,
            ),
      },
    );
  }
}

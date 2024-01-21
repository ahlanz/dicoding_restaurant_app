import 'package:dicoding_restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:dicoding_restaurant_app/provider/restoran_provider.dart';
import 'package:dicoding_restaurant_app/screen/restaurant_detail_page.dart';
import 'package:dicoding_restaurant_app/screen/restaurant_list_page.dart';
import 'package:dicoding_restaurant_app/screen/search_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RestaurantProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailRestaurantProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant App',
        initialRoute: RestaurantListPage.routName,
        routes: {
          RestaurantListPage.routName: (context) => const RestaurantListPage(),
          RestaruantDetailPage.routName: (context) =>
              const RestaruantDetailPage(),
          SearchPage.routeName: (context) => const SearchPage(),
        },
      ),
    );
  }
}

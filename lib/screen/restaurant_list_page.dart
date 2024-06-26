import 'package:dicoding_restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:dicoding_restaurant_app/provider/restoran_provider.dart';

import 'package:dicoding_restaurant_app/screen/search_page.dart';
import 'package:dicoding_restaurant_app/service/restaurant_detail_service.dart';
import 'package:dicoding_restaurant_app/service/search_service.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:dicoding_restaurant_app/widget/list_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantListPage extends StatefulWidget {
  static const routName = '/restaurant-list';
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantProvider>(context, listen: false).fetchRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    final SearchService searchService = SearchService();
    void ambilData() async {
      try {
        final listData = await searchService.searchProduct('melting');
        print(listData);
      } catch (e) {
        print('Errror : $e');
      }
    }

    Future<void> _refreshData() async {
      await Future.delayed(const Duration(seconds: 2));
      await restaurantProvider.fetchRestaurant();
    }

    Widget judulApp() {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _refreshData,
                  child: Text(
                    'Restaurant',
                    style: primaryTextStyle.copyWith(
                      fontSize: 25,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SearchPage.routeName);
                  },
                  icon: const Icon(
                    Icons.search,
                    color: primaryTextColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Recomendation restaurant for you',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            )
          ],
        ),
      );
    }

    Widget listProdukItem(BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: restaurantProvider.restaurant
              .map((restaurant) => ListCardRestaurant(
                    restaurant: restaurant,
                  ))
              .toList(),
        ),
      );
    }

    PreferredSizeWidget header() {
      return AppBar(
        title: judulApp(),
        toolbarHeight: 110,
      );
    }

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Scaffold(
        appBar: header(),
        body: restaurantProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : restaurantProvider.isError
                ? Center(
                    child: Text(
                      'Error Tidak Ada Internet',
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  )
                : listProdukItem(context),
      ),
    );
  }
}

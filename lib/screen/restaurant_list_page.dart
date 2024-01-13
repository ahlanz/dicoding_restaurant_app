import 'dart:convert';

import 'package:dicoding_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:flutter/material.dart';

class RestaurantListPage extends StatelessWidget {
  static const routName = '/restaurant-list';
  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget judulApp() {
      return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant',
              style: primaryTextStyle.copyWith(
                fontSize: 25,
                fontWeight: semiBold,
              ),
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

    List<RestaurantModel> parseProduk(String? json) {
      if (json == null) {
        return [];
      }

      final Map<String, dynamic> jsonData = jsonDecode(json);
      final List<dynamic> restaurantsData = jsonData['restaurants'];

      return restaurantsData
          .map((json) => RestaurantModel.fromJson(json))
          .toList();
    }

    Widget alamatPorduk(String city, double rating, String description) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //alamat makanan
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: secondaryColor,
                size: 20,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                city,
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          //deskripsi makanan
          Text(
            description,
            style: secondaryTextStyle.copyWith(
              fontSize: 10,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '$rating/10',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      );
    }

    Widget listProdukItem(BuildContext context, RestaurantModel restaurant) {
      return Material(
        child: Container(
          margin: const EdgeInsets.only(
            top: 10,
            right: 20,
            left: 20,
            bottom: 10,
          ),
          padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: bgcolor1,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(1, 2), // Shadow position
              ),
            ],
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    restaurant.pictureId,
                    width: 104,
                    height: 104,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/img/image_menu_dafault.png',
                        width: 104,
                        height: 104,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semiBold,
                        ),
                      ),
                      alamatPorduk(
                        restaurant.city,
                        restaurant.rating,
                        restaurant.description,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget listBuilderProduk(BuildContext context) {
      return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/json/local_restaurant.json'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<RestaurantModel> restaurant = parseProduk(snapshot.data);
            return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return listProdukItem(context, restaurant[index]);
              },
            );
          }
        },
      );
    }

    PreferredSizeWidget header() {
      return AppBar(
        title: judulApp(),
        toolbarHeight: 110,
      );
    }

    return Scaffold(
      appBar: header(),
      body: listBuilderProduk(context),
    );
  }
}

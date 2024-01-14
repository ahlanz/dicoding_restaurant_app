import 'package:dicoding_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:dicoding_restaurant_app/widget/menu_card.dart';
import 'package:dicoding_restaurant_app/widget/menu_minuman_card.dart';
import 'package:flutter/material.dart';

class RestaruantDetailPage extends StatelessWidget {
  final RestaurantModel restaurant;
  static const routName = '/restaurant-detail';
  const RestaruantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget header() {
      return AppBar(
        title: Text(
          'Detail Restaurant',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget imageUrl() {
      return SizedBox(
        child: Image.network(
          '${restaurant.pictureId}',
          width: double.infinity,
          height: 300,
        ),
      );
    }

    Widget judulRestorant() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Text(
              restaurant.name,
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
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
                  restaurant.city,
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            //rating tempat
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
                  '${restaurant.rating}/10',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget deskripsi() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Text(
              'Deskripsi',
              style: primaryTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            Text(
              restaurant.description,
              style: secondaryTextStyle.copyWith(
                fontSize: 14,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
    }

    Widget listProdukMakanan(BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: restaurant.foods
              .map(
                (food) => MenuCard(produk: food),
              )
              .toList(),
        ),
      );
    }

    Widget menuMakanan() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 15,
        ),
        child: Text(
          'Menu Makanan',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget menuMinuman() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 15,
        ),
        child: Text(
          'Menu Minuman',
          style: primaryTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget listProdukMinuman(BuildContext context) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: restaurant.drinks
              .map(
                (drinks) => MenuMinumanCard(produk: drinks),
              )
              .toList(),
        ),
      );
    }

    Widget content() {
      return SizedBox(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageUrl(),
              judulRestorant(),
              deskripsi(),
              menuMakanan(),
              listProdukMakanan(context),
              menuMinuman(),
              listProdukMinuman(context)
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgcolor1,
      appBar: header(),
      body: content(),
    );
  }
}

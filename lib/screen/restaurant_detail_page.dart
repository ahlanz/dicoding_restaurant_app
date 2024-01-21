import 'package:dicoding_restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaruantDetailPage extends StatelessWidget {
  static const routName = '/restaurant-detail';
  const RestaruantDetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DetailRestaurantProvider detailProvider =
        Provider.of<DetailRestaurantProvider>(context);
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
          'https://restaurant-api.dicoding.dev/images/large/${detailProvider.detailRestaurant?.pictureId}',
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
              detailProvider.detailRestaurant?.name ?? '',
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
                  detailProvider.detailRestaurant?.city ?? '',
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
                  '${detailProvider.detailRestaurant?.rating}/10',
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
              detailProvider.detailRestaurant?.description ?? 'error',
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

    // Widget listProdukMakanan(BuildContext context) {
    //   return SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Row(
    //       children: restaurant.foods
    //           .map(
    //             (food) => MenuCard(produk: food),
    //           )
    //           .toList(),
    //     ),
    //   );
    // }

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

    // Widget listProdukMinuman(BuildContext context) {
    //   return SingleChildScrollView(
    //     scrollDirection: Axis.horizontal,
    //     child: Row(
    //       children: restaurant.drinks
    //           .map(
    //             (drinks) => MenuMinumanCard(produk: drinks),
    //           )
    //           .toList(),
    //     ),
    //   );
    // }

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
              // listProdukMakanan(context),
              menuMinuman(),
              // listProdukMinuman(context)
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

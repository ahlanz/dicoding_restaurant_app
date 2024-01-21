import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:dicoding_restaurant_app/provider/detail_restaurant_provider.dart';
import 'package:dicoding_restaurant_app/screen/restaurant_detail_page.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCardRestaurant extends StatelessWidget {
  final ProdukModel restaurant;

  const ListCardRestaurant({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    final DetailRestaurantProvider detailProvider =
        Provider.of<DetailRestaurantProvider>(context);
    Widget alamatPorduk() {
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
          //deskripsi makanan
          Text(
            restaurant.description,
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
                '${restaurant.rating}/10',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      );
    }

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
          onTap: () async {
            try {
              await detailProvider.fetchDetailRestaurant(restaurant.id);
              Navigator.pushNamed(context, RestaruantDetailPage.routName,
                  arguments: restaurant.id);
            } catch (e) {
              print('error $e');
            }
          },
          title: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
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
              const SizedBox(width: 16),
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
                    alamatPorduk(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

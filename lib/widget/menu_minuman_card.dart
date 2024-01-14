import 'package:dicoding_restaurant_app/model/restaurant_model.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:flutter/material.dart';

class MenuMinumanCard extends StatelessWidget {
  final DrinkModel produk;
  const MenuMinumanCard({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 20,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/img/image_menu_dafault.png',
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 15,
            ),
            child: SizedBox(
              width: 190,
              child: Text(
                produk.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

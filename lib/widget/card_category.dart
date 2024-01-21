import 'package:dicoding_restaurant_app/model/category_model.dart';
import 'package:dicoding_restaurant_app/theme/theme.dart';
import 'package:flutter/material.dart';

class CardCategory extends StatelessWidget {
  final CategoryModel kategori;
  const CardCategory({
    super.key,
    required this.kategori,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(left: 10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber,
      ),
      child: Center(
        child: Text(
          kategori.name,
          style: primaryTextStyle.copyWith(
            fontSize: 14,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}

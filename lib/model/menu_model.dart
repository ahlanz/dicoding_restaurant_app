import 'package:dicoding_restaurant_app/model/restaurant_model.dart';

class MenuModel {
  late List<FoodModel> food;
  late List<DrinkModel> drinks;

  MenuModel({
    required this.food,
    required this.drinks,
  });

  MenuModel.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      food = json['foods']
          .map<FoodModel>((food) => FoodModel.fromJson(food))
          .toList();
    }

    if (json['drinks'] != null) {
      drinks = json['drinks']
          .map<DrinkModel>((food) => DrinkModel.fromJson(food))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'foods': food.map((food) => food.toJson()).toList(),
      'drinks': drinks.map((drinks) => drinks.toJson()).toList(),
    };
  }
}

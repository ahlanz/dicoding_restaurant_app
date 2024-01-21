class RestaurantModel {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  List<FoodModel> foods;
  List<DrinkModel> drinks;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.foods,
    required this.drinks,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toDouble(),
      foods: (json['menus']['foods'] as List<dynamic>)
          .map((food) => FoodModel.fromJson(food))
          .toList(),
      drinks: (json['menus']['drinks'] as List<dynamic>)
          .map((drink) => DrinkModel.fromJson(drink))
          .toList(),
    );
  }
}

class FoodModel {
  final String name;

  FoodModel({required this.name});

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

class DrinkModel {
  final String name;

  DrinkModel({required this.name});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    return DrinkModel(name: json['name']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}

import 'package:dicoding_restaurant_app/model/category_model.dart';
import 'package:dicoding_restaurant_app/model/customer_review_model.dart';
import 'package:dicoding_restaurant_app/model/menu_model.dart';

class DetailModel {
  String? id;
  String? name;
  String? description;
  String? city;
  String? address;
  String? pictureId;
  late List<CategoryModel> category;
  MenuModel? menus;
  dynamic rating;
  late List<CustomerReviewModel> customers;

  DetailModel({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.menus,
    required this.category,
    this.rating,
    required this.customers,
  });

  DetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    description = json['description'] ?? '';
    city = json['city'] ?? '';
    address = json['address'] ?? '';
    pictureId = json['pictureId'] ?? '';
    if (json['categories'] != null) {
      category = json['categories']
          .map<CategoryModel>(
              (categories) => CategoryModel.fromJson(categories))
          .toList();
    }

    if (json['menus'] != null) {
      menus = MenuModel.fromJson(json['menus']);
    }

    rating = json['rating'];

    if (json['customerReviews'] != null) {
      customers = json['customerReviews']
          .map<CustomerReviewModel>(
              (drinks) => CustomerReviewModel.fromJson(drinks))
          .toList();
    }

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'name': name,
        'description': description,
        'city': city,
        'address': address,
        'pictureId': pictureId,
        'menus': menus?.toJson(),
        'rating': rating,
        'categories': category.map((category) => category.toJson()).toList(),
        'customerReviews':
            customers.map((customer) => customer.toJson()).toList()
      };
    }
  }
}

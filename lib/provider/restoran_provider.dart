import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:dicoding_restaurant_app/service/produk_service.dart';
import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantService _restaurantService = RestaurantService();
  bool _isloading = false;
  bool _isError = false;
  List<ProdukModel> _restaurant = [];
  bool get isError => _isError;
  bool get isLoading => _isloading;
  List<ProdukModel> get restaurant => _restaurant;

  void setRestaurant(List<ProdukModel> restaurants) {
    _restaurant = restaurants;
    notifyListeners();
  }

  Future<List<ProdukModel>> fetchRestaurant() async {
    try {
      _isloading = true;
      _restaurant = await _restaurantService.getRestaurant();
      setRestaurant(_restaurant);
      return _restaurant;
    } catch (e) {
      print('Error fetching restaurant data: $e');
      _isError = true;
    } finally {
      _isloading = false;
      notifyListeners();
    }
    return [];
  }
}

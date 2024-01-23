import 'package:dicoding_restaurant_app/service/restaurant_detail_service.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_restaurant_app/model/fix_detail_model.dart';

class DetailRestaurantProvider extends ChangeNotifier {
  final DetailRestaurantService _detailRestaurantService =
      DetailRestaurantService();
  bool _isLoading = false;
  bool _isError = false;
  DetailModel? _detailRestaurant;

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  DetailModel? get detailRestaurant => _detailRestaurant;

  set detailRestaurant(DetailModel? detailRestaurant) {
    _detailRestaurant = detailRestaurant;
    notifyListeners();
  }

  Future<void> fetchDetailRestaurant(String id) async {
    try {
      _isLoading = true;
      notifyListeners();
      final DetailModel? data = await _detailRestaurantService.getDetail(id);
      detailRestaurant = data;
      notifyListeners();
    } catch (e) {
      print('Error fetching detail restaurant data: $e');
      _isError = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

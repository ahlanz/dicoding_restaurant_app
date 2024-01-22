import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:dicoding_restaurant_app/service/search_service.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  SearchService searchService = SearchService();

  List<ProdukModel> _hasilSearch = [];
  bool _isLoading = false;
  String _error = '';

  List<ProdukModel> get hasilSearch => _hasilSearch;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> searchRestaurant(String name) async {
    _error = '';
    _isLoading = true;

    try {
      List<ProdukModel>? hasil = await searchService.searchProduct(name);

      if (hasil != null) {
        hasilSearch.addAll(hasil);
      } else if (name.isNotEmpty) {
        _hasilSearch = hasilSearch
            .where((hasil) =>
                hasil.name.toLowerCase().contains(name.toLowerCase()))
            .toList();
        print('Pencarian berhasil');
      } else {
        _hasilSearch = hasilSearch;
        print('pencarian tidak ada : $_hasilSearch');
      }
    } catch (e) {
      print('error : $e');
    }
    _isLoading = false;
    notifyListeners();
  }
}

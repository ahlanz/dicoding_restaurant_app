import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:dicoding_restaurant_app/service/search_service.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  SearchService searchService = SearchService();

  List<ProdukModel> _hasilSearch = [];
  bool _isLoading = false;
  String _error = '';
  bool _isError = false;

  List<ProdukModel> get hasilSearch => _hasilSearch;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get isError => _isError;

  Future<void> searchRestaurant(String name) async {
    _error = '';
    _isLoading = true;
    notifyListeners();
    try {
      List<ProdukModel>? hasil = await searchService.searchProduct(name);

      if (hasil != null) {
        _hasilSearch.clear();
        _hasilSearch.addAll(hasil);
      } else if (name.isNotEmpty) {
        _hasilSearch = hasilSearch
            .where((hasil) =>
                hasil.name.toLowerCase().contains(name.toLowerCase()))
            .toList();
        print('Pencarian berhasil');
      } else if (hasil == null) {
        _isError = true;
        notifyListeners();
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

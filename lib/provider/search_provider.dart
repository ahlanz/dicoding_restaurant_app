import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:dicoding_restaurant_app/service/search_service.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  SearchService searchService = SearchService();
  ConnectionState _connectionState = ConnectionState.none;
  Connectivity _connectivity = Connectivity();

  List<ProdukModel> _hasilSearch = [];
  bool _isLoading = false;
  String _error = '';
  bool _isError = false;
  ConnectionState get connectionState => _connectionState;

  List<ProdukModel> get hasilSearch => _hasilSearch;
  bool get isLoading => _isLoading;
  String get error => _error;
  bool get isError => _isError;

  void setConnectionState(ConnectionState state) {
    _connectionState = state;
    notifyListeners();
  }

  Future<void> searchRestaurant(String name) async {
    _error = '';
    _isLoading = true;
    notifyListeners();
    try {
      var connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult == ConnectivityResult.none) {
        _isError = true;
        notifyListeners();
      } else {
        _isError = false;
        notifyListeners();
      }

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
        setConnectionState(ConnectionState.done);
      } else if (hasil == null) {
        _isError = true;
        notifyListeners();
      } else {
        _hasilSearch = hasilSearch;
        print('pencarian tidak ada : $_hasilSearch');
        setConnectionState(ConnectionState.done);
      }
    } catch (e) {
      print('error : $e');
    }
    _isLoading = false;
    notifyListeners();
  }

  void resetSearchResult() {
    _hasilSearch.clear();
    _hasilSearch = [];
    notifyListeners();
  }
}

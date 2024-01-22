import 'dart:convert';

import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:http/http.dart' as http;

class SearchService {
  String baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<List<ProdukModel>> searchProduct(String? name) async {
    var url = Uri.parse('$baseUrl/search?q=$name');
    var headers = {'content-type': 'application/json'};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['restaurants'];
      List<ProdukModel> hasilSearch = [];

      for (var item in data) {
        var searchRestaurant = ProdukModel.fromJson(item);
        hasilSearch.add(searchRestaurant);
      }
      print('hasil search berhasil : ${hasilSearch[0].name}');
      return hasilSearch;
    } else {
      print('Gagal search service');
    }
    return [];
  }
}

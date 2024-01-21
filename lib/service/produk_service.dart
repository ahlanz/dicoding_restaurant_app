import 'dart:convert';
import 'package:dicoding_restaurant_app/model/produk_model.dart';
import 'package:http/http.dart' as http;

class RestaurantService {
  String baseUrl = 'https://restaurant-api.dicoding.dev';

  Future<List<ProdukModel>> getRestaurant() async {
    var url = Uri.parse('$baseUrl/list');
    var headers = {'content-type': 'application/json'};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['restaurants'];
      List<ProdukModel> produk = [];
      for (var item in data) {
        produk.add(ProdukModel.fromJson(item));
      }
      print(produk);
      return produk;
    } else {
      print('Gagal get response');
    }
    return [];
  }
}

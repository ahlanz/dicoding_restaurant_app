import 'dart:convert';
import 'package:dicoding_restaurant_app/model/fix_detail_model.dart';
import 'package:http/http.dart' as http;

class DetailRestaurantService {
  String baseUrl = 'https://restaurant-api.dicoding.dev';
  Future<DetailModel?> getDetail(String id) async {
    var url = Uri.parse('$baseUrl/detail/$id');
    var headers = {'content-type': 'application/json'};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      var detailRestaurant = DetailModel.fromJson(data['restaurant']);

      return detailRestaurant;
    } else {
      print('Gagal get response');
    }
    return null;
  }
}


import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:clean_architecture/data/models/lokasi.dart';

class LokasiRepository {

  Future<LokasiListResponse> fetchLokasi() async {
    final response = await http.get('https://my.api.mockaroo.com/mall.json?key=dbcde960');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
//      return Album.fromJson(jsonDecode(response.body));
      final listInJson = jsonDecode(response.body) as List;

      return LokasiListResponse(listInJson.map((e) => Lokasi.fromJson(e)).toList());
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Lokasi');
    }
  }

}
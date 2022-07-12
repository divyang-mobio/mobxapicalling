import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_model.dart';

class HttpServices {
  Future<List<DataModel>> getCall(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List dynamicList = jsonDecode(response.body);
      List<DataModel> data =
          dynamicList.map((e) => DataModel.fromJson(e)).toList();
      return data;
    } else {
      throw "error";
    }
  }
}

import 'dart:convert';

import 'package:asignment/models/sider_model.dart';
import 'package:http/http.dart' as https;
class SliderData {
  Future<SliderModel> getSliderData() async{
    String url = "https://wedo-api.technationme.com/api/sliders";
    final result = await https.get(url);
    if(result.statusCode != 200)
    throw Exception();
    return SliderModel.fromjson(json.decode(result.body));
  }
}
class CitiesData {
  Future<CitiesModel> getCitiesData() async{
    String url = "https://wedo-api.technationme.com/api/cities";
    final result = await https.get(url);
    if(result.statusCode != 200)
    throw Exception();
    return CitiesModel.fromjson(json.decode(result.body));
  }
}
class CatogoriesData {
  Future<CatogoriesModel> getCatData() async{
    String url = "https://wedo-api.technationme.com/api/categories";
    final result = await https.get(url);
    if(result.statusCode != 200)
    throw Exception();
    return CatogoriesModel.fromjson(json.decode(result.body));
  }
}
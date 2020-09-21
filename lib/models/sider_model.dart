
class SliderModel {
  final getSlidersData;
  String get getSlider => getSlidersData;
  SliderModel(this.getSlidersData);
  factory SliderModel.fromjson(Map<String, dynamic> json){
    return SliderModel(
      json
    );
  }
}
class CitiesModel {
  final getCitiesData;
  String get getCity => getCitiesData;
  CitiesModel(this.getCitiesData);
  factory CitiesModel.fromjson(Map<String, dynamic> json){
    print("CITY MODEL... $json");

    return CitiesModel(
      json
    );
  }
}
class CatogoriesModel {
  final getCAtData;
  String get getcatogory => getCAtData;
  CatogoriesModel(this.getCAtData);
  factory CatogoriesModel.fromjson(Map<String, dynamic> json){
    return CatogoriesModel(
      json
    );
  }
}
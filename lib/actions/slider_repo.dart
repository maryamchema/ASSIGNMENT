import 'package:asignment/actions/slider_action.dart';
import 'package:asignment/models/sider_model.dart';

class SliderRepo {
  SliderData sliderData = SliderData();
  Future<SliderModel> getSliderData() => sliderData.getSliderData();
}
class CitiesRepo {
  CitiesData cityData = CitiesData();
  Future<CitiesModel> getCitiesData() => cityData.getCitiesData();
}
class CatogoriesRepo {
  CatogoriesData catData = CatogoriesData();
  Future<CatogoriesModel> getCatData() => catData.getCatData();
}
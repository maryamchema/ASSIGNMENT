import 'package:asignment/actions/slider_repo.dart';
import 'package:asignment/models/sider_model.dart'; 
import 'package:rxdart/rxdart.dart';

class SliderBloc {
  SliderRepo sliderRepo = SliderRepo();
  final sliderDataFetcher = PublishSubject<SliderModel>();
  Stream<SliderModel> get sliderdata => sliderDataFetcher.stream;
  getSliderData() async {
    SliderModel responseData = await sliderRepo.getSliderData();
    sliderDataFetcher.sink.add(responseData);
  }
  dispose() {
    sliderDataFetcher.close();
  }
}
final sliderBloc = SliderBloc();

class CitiesBloc {
  CitiesRepo cityRepo = CitiesRepo();
  final cityDataFetcher = PublishSubject<CitiesModel>();
  Stream<CitiesModel> get citydata => cityDataFetcher.stream;
  getCitiesData() async {
    CitiesModel responseData = await cityRepo.getCitiesData();
    cityDataFetcher.sink.add(responseData);
  }
  dispose() {
    cityDataFetcher.close();
  }
}
final cityBloc = CitiesBloc();

class CatogoryBloc {
  CatogoriesRepo catRepo = CatogoriesRepo();
  final catDataFetcher = PublishSubject<CatogoriesModel>();
  Stream<CatogoriesModel> get catdata => catDataFetcher.stream;
  getCatData() async {
    CatogoriesModel responseData = await catRepo.getCatData();
    catDataFetcher.sink.add(responseData);
  }
  dispose() {
    catDataFetcher.close();
  }
}
final catogoryBloc = CatogoryBloc();
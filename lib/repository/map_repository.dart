import 'package:pcru_app/configs/constant.dart';
import 'package:pcru_app/models/map_model.dart';
import 'package:dio/dio.dart';

class MapRepository {
  final Dio dio = Dio();

  Future<List<MapModel>> getMaps() async {
    final response = await dio.get(Constant.URL_API + '/map');
    final data = response.data as List;
    return data.map((item) => MapModel.fromJson(item)).toList();
  }

  Future<MapModel> getMap(String id) async {
    final response = await dio.get(Constant.URL_API + '/map/$id');
    final data = response.data;
    return MapModel.fromJson(data);
  }

  Future<List<MapModel>> getMapsPage(int page) async {
    final response = await dio.get(Constant.URL_API + '/map?page=$page');
    final data = response.data as List;
    return data.map((item) => MapModel.fromJson(item)).toList();
  }
}

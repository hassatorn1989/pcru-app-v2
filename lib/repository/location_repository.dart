import 'package:dio/dio.dart';
import 'package:pcru_app/configs/constant.dart';
import 'package:pcru_app/models/location_model.dart';

class LocationRepository {
  final Dio dio = Dio();

  // Future<List<LocationModel>> getLocations() async {
  //   try {
  //     final response = await dio.get(
  //       '${Constant.URL_API}/api/building',
  //       options: Options(
  //         headers: {
  //           'X-Authorization': Constant.APIKEY,
  //         },
  //       ),
  //     );
  //     final data = response.data as List;
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // Future<LocationModel> getLocation(String id) async {
  //   final response = await dio.get(
  //     '${Constant.URL_API}/api/building/$id',
  //     options: Options(
  //       headers: {
  //         'X-Authorization': Constant.APIKEY,
  //       },
  //     ),
  //   );
  //   final data = response.data;
  //   re
  // }

  Future<dynamic> getLocationsPage(int page) async {
    try {
      final response = await dio.get(
        '${Constant.URL_API}/api/building?page=$page',
        options: Options(
          headers: {
            'X-Authorization': Constant.APIKEY,
          },
        ),
      );
      return response.data;
    } catch (e) {
      throw Exception(e.toString());
    }
    // final response = await dio.get(
    //   '${Constant.URL_API}/api/building',
    //   options: Options(
    //     headers: {
    //       'X-Authorization': Constant.APIKEY,
    //     },
    //   ),
    // );
    // print(response.toString());
    // return [];
    // if (response.statusCode == 200) {

    //   // final data = response.data as List;
    //   // return data.map((dynamic json) {
    //   //   final map = json as Map<String, dynamic>;
    //   //   return LocationModel(
    //   //     id: map['id'] as String,
    //   //     code: map['code'] as String,
    //   //     name: map['name'] as String,
    //   //     lat: map['lat'] as String,
    //   //     long: map['long'] as String,
    //   //     latLong: map['lat_long'] as String,
    //   //     image: map['image'] as String,
    //   //     // section: map['section'] != null
    //   //     //     ? Section.fromJson(map['section'] as Map<String, dynamic>)
    //   //     //     : null,
    //   //   );
    //   // }).toList();
    // } else {
    //   throw Exception('Failed to load data');
    // }
  }
}

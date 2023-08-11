class LocationModel {
  String? id;
  String? code;
  String? name;
  String? lat;
  String? long;
  String? latLong;
  String? image;
  Section? section;

  LocationModel(
      {this.id,
      this.code,
      this.name,
      this.lat,
      this.long,
      this.latLong,
      this.image,
      this.section});

  LocationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    lat = json['lat'];
    long = json['long'];
    latLong = json['lat_long'];
    image = json['image'].toString();
    section =
        json['section'] != null ? new Section.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['lat_long'] = this.latLong;
    data['image'] = this.image;
    if (this.section != null) {
      data['section'] = this.section!.toJson();
    }
    return data;
  }
}

class Section {
  Section({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

// import 'package:equatable/equatable.dart';

// class LocationModel extends Equatable {
//   final String id;
//   final String code;
//   final String name;
//   final String lat;
//   final String long;
//   final String latLong;
//   final String image;
//   // final String section;
//   const LocationModel({
//     required this.id,
//     required this.code,
//     required this.name,
//     required this.lat,
//     required this.long,
//     required this.latLong,
//     required this.image,
//     required this.section,
//   });
// }

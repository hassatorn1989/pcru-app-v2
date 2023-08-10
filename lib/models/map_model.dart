
import 'package:equatable/equatable.dart';

class MapModel extends Equatable {
  final String name;
  final String description;
  final String image;
  final String latitude;
  final String longitude;

  const MapModel({
    required this.name,
    required this.description,
    required this.image,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        image,
        latitude,
        longitude,
      ];

  static MapModel fromJson(dynamic json) {
    return MapModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  dynamic toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
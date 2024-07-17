import 'package:latlong2/latlong.dart';

class HistoryModel {
  LatLng position;
  DateTime dateTime;
  String distance;

  HistoryModel({
    required this.position,
    required this.dateTime,
    required this.distance,
  });

  static List<HistoryModel> listFromJson(List data) =>
      data.map((e) => HistoryModel.fromJson(e)).toList();

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        position: LatLng.fromJson(json["position"]),
        dateTime: DateTime.parse(json["dateTime"]),
        distance: json["distance"],
      );

  Map<String, dynamic> toJson() => {
        "position": position,
        "dateTime": dateTime.toIso8601String(),
        "distance": distance,
      };
}

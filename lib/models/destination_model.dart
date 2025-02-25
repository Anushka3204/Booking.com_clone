// lib/models/destination_model.dart
class Destination {
  final String destId;
  final String searchType;
  final String region;
  final String roundtrip;
  final String cityName;
  final int cityUfi;
  final int hotels; // number of hotels
  final String country;
  final String lc;
  final String imageUrl;
  final String label;
  final double latitude;
  final String destType;
  final String name;
  final double longitude;
  final String type;
  final String cc1;

  Destination({
    required this.destId,
    required this.searchType,
    required this.region,
    required this.roundtrip,
    required this.cityName,
    required this.cityUfi,
    required this.hotels,
    required this.country,
    required this.lc,
    required this.imageUrl,
    required this.label,
    required this.latitude,
    required this.destType,
    required this.name,
    required this.longitude,
    required this.type,
    required this.cc1,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      destId: json["dest_id"]?.toString() ?? '',
      searchType: json["search_type"]?.toString() ?? '',
      region: json["region"]?.toString() ?? '',
      roundtrip: json["roundtrip"]?.toString() ?? '',
      cityName: json["city_name"]?.toString() ?? '',
      cityUfi: int.tryParse(json["city_ufi"]?.toString() ?? '') ?? 0,
      hotels: int.tryParse(json["hotels"]?.toString() ?? '') ?? 0,
      country: json["country"]?.toString() ?? '',
      lc: json["lc"]?.toString() ?? '',
      imageUrl: json["image_url"]?.toString() ?? '',
      label: json["label"]?.toString() ?? '',
      latitude: json["latitude"] == null
          ? 0.0
          : (json["latitude"] is int
              ? (json["latitude"] as int).toDouble()
              : double.tryParse(json["latitude"].toString()) ?? 0.0),
      destType: json["dest_type"]?.toString() ?? '',
      name: json["name"]?.toString() ?? '',
      longitude: json["longitude"] == null
          ? 0.0
          : (json["longitude"] is int
              ? (json["longitude"] as int).toDouble()
              : double.tryParse(json["longitude"].toString()) ?? 0.0),
      type: json["type"]?.toString() ?? '',
      cc1: json["cc1"]?.toString() ?? '',
    );
  }
}

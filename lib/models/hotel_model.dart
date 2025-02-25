// lib/models/hotel_model.dart
class Hotel {
  final String name;
  final String address;
  final String price;
  final String imageUrl;

  Hotel({
    required this.name,
    required this.address,
    required this.price,
    required this.imageUrl,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['hotel_name'] ?? 'No Name',
      address: json['address'] ?? 'No Address',
      price: json['price']?.toString() ?? 'N/A',
      imageUrl: json['image_url'] ?? '',
    );
  }
}

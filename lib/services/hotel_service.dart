// lib/services/hotel_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/destination_model.dart';

class HotelService {
  // Updated endpoint using your curl command
  static const String _endpoint =
      "https://booking-com15.p.rapidapi.com/api/v1/hotels/searchDestination";

  static Future<List<Destination>> fetchDestinations({
    required String destinationQuery,
    required String checkIn, // include if supported by your API
    required String checkOut, // include if supported by your API
    required String rooms, // include if supported by your API
  }) async {
    // Build the URL with query parameters.
    // The curl shows the API accepts a "query" parameter.
    // If your API supports additional parameters, they can be appended here.
    final Uri url = Uri.parse(_endpoint).replace(queryParameters: {
      'query': destinationQuery,
      'checkin': checkIn,
      'checkout': checkOut,
      'rooms': rooms,
    });

    // Headers required by the API. (Remember to secure your API key in production.)
    final headers = {
      'x-rapidapi-host': 'booking-com15.p.rapidapi.com',
      'x-rapidapi-key': '94e5999c47msh7a64d356faaa760p1b75eajsn392f227c4818',
      'Content-Type': 'application/json',
    };

    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      // Expecting a response similar to:
      // {
      //   "status": true,
      //   "message": "Success",
      //   "timestamp": 1739725005441,
      //   "data": [ { ... }, { ... }, ... ]
      // }
      if (jsonResponse['status'] == true) {
        final List<dynamic> data = jsonResponse['data'];
        return data.map((item) => Destination.fromJson(item)).toList();
      } else {
        throw Exception("API error: ${jsonResponse['message']}");
      }
    } else {
      throw Exception(
          "Failed to load destinations. HTTP Status: ${response.statusCode}");
    }
  }
}

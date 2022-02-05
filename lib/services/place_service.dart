// import 'dart:convert';
// import 'dart:html';

// import 'package:bpbd/models/place_search.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// import 'package:http/http.dart';

// class PlaceService {
//   Future<List<PlaceSearch>> getAutoComplete(String search) async {
//     var url =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types={cities}&key=AIzaSyDafHTY2k1B7_YV9hBOX7woxcS9DEDdWmk';
//     var response = await http.get(Uri.parse(url));
//     var json = convert.jsonDecode(response.body);
//     var jsonResults = json['predictions'] as List;
//     return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
//   }
// }

import 'dart:convert';

import 'package:http/http.dart';

class Place {
  String streetNumber;
  String street;
  String city;
  String zipCode;

  Place({
    required this.streetNumber,
    required this.street,
    required this.city,
    required this.zipCode,
  });

  @override
  String toString() {
    return 'Place(streetNumber: $streetNumber, street: $street, city: $city, zipCode: $zipCode)';
  }
}

// For storing our result
class Suggestion {
  late String placeId;
  late String description;

  Suggestion(this.placeId, this.description);

  @override
  String toString() {
    return 'Suggestion(description: $description, placeId: $placeId)';
  }
}

class PlaceApiProvider {
  final client = Client();

  PlaceApiProvider(this.sessionToken);

  final sessionToken;

  static final String apiKey = 'AIzaSyDafHTY2k1B7_YV9hBOX7woxcS9DEDdWmk';

  Future<List<Suggestion>> fetchSuggestions(String? input, String? lang) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ch&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        // compose suggestions in a list
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(
                  p['place_id'],
                  p['description'],
                ))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<Place> getPlaceDetailFromId(String placeId) async {
    final request =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=address_component&key=$apiKey&sessiontoken=$sessionToken';
    final response = await client.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      if (result['status'] == 'OK') {
        final components =
            result['result']['address_components'] as List<dynamic>;
        // build result
        final place = Place(
          city: '',
          street: '',
          streetNumber: '',
          zipCode: '',
        );
        components.forEach((c) {
          final List type = c['types'];
          if (type.contains('street_number')) {
            place.streetNumber = c['long_name'];
          }
          if (type.contains('route')) {
            place.street = c['long_name'];
          }
          if (type.contains('locality')) {
            place.city = c['long_name'];
          }
          if (type.contains('postal_code')) {
            place.zipCode = c['long_name'];
          }
        });
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}
